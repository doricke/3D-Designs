class UsedsController < ApplicationController
  before_action :set_used, only: [:show, :edit, :update, :destroy]

# Author::    	Darrell O. Ricke, Ph.D., MIT Lincoln Laboraotry
# Copyright:: 	Copyright (c) 2014 Massachusetts Institute of Technogy 
# License::   	GNU GPL license  (http://www.gnu.org/licenses/)
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.
 
  # GET /useds
  # GET /useds.json
  def index
    @useds = Used.find_all_by_design_id(session[:design_id])
    @users = User.all
    @users_hash = Tools::to_hash(@users)
  end  # index

  # GET /useds/1
  # GET /useds/1.json
  def show
  end  # show

  # GET /useds/new
  def new
    @used = Used.new
  end

  # GET /useds/1/edit
  def edit
  end  # edit

  # POST /useds
  # POST /useds.json
  def create
    @used = Used.new(used_params)
    @used.design_id = session[:design_id]
    @used.user_id = session[:user_id]
    @used.created_at = Time::now

    respond_to do |format|
      if @used.save
          format.html { redirect_to design_path(session[:design_id]), notice: 'Design use added' }
        format.json { render action: 'show', status: :created, location: @used }
      else
        format.html { render action: 'new' }
        format.json { render json: @used.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /useds/1
  # PATCH/PUT /useds/1.json
  def update
    respond_to do |format|
      if @used.update(used_params)
        puts "###### Notes: #{@used.notes}"
        format.html { redirect_to @used, notice: 'Used was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @used.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /useds/1
  # DELETE /useds/1.json
  def destroy
    @used.destroy
    respond_to do |format|
      format.html { redirect_to design_path(session[:design_id]) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_used
      @used = Used.find(params[:id])
      @owns = (session[:user_id] == @used.user_id) if ! @used.nil?
      @owns = true if session[:is_admin]  
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def used_params
      params.require(:used).permit(:design_id, :user_id, :notes, :created_at)
    end  # used_params
end  # class
