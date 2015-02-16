class DerivedsController < ApplicationController
  before_action :set_derived, only: [:show, :edit, :update, :destroy]

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
 
  # GET /deriveds
  # GET /deriveds.json
  def index
    @deriveds = Derived.find_all_by_design_id(session[:design_id])
  end  # index

  # GET /deriveds/1
  # GET /deriveds/1.json
  def show
  end

  # GET /deriveds/new
  def new
    @derived = Derived.new
  end

  # GET /deriveds/1/edit
  def edit
  end

  # POST /deriveds
  # POST /deriveds.json
  def create
    @derived = Derived.new(derived_params)

    respond_to do |format|
      if @derived.save
        format.html { redirect_to @derived, notice: 'Derived was successfully created.' }
        format.json { render action: 'show', status: :created, location: @derived }
      else
        format.html { render action: 'new' }
        format.json { render json: @derived.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deriveds/1
  # PATCH/PUT /deriveds/1.json
  def update
    respond_to do |format|
      if @derived.update(derived_params)
        format.html { redirect_to @derived, notice: 'Derived was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @derived.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deriveds/1
  # DELETE /deriveds/1.json
  def destroy
    @derived.destroy if session[:is_admin]
    respond_to do |format|
      format.html { redirect_to designs_url }
      format.json { head :no_content }
    end  # do
  end  # destroy

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_derived
      @derived = Derived.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def derived_params
      params.require(:derived).permit(:design_id, :source_id, :derived_type)
    end
end
