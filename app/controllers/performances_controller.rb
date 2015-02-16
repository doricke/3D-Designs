class PerformancesController < ApplicationController
  before_action :set_performance, only: [:show, :edit, :update, :destroy, :download]

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
 
  # GET /performances
  # GET /performances.json
  def index
    @performances = Performance.find_all_by_design_id(session[:design_id])
  end  # index

  # GET /performances/1
  # GET /performances/1.json
  def show
  end  # show

  # GET /performances/new
  def new
    @performance = Performance.new
  end  # new

  # GET /performances/1/edit
  def edit
  end  # edit

  # POST /performances
  # POST /performances.json
  def create
    @performance = Performance.new(performance_params)
    @performance.design_id = session[:design_id]
    @performance.updated_at = Time::now
      
    respond_to do |format|
      if @performance.save
        format.html { redirect_to design_path(session[:design_id]), notice: 'Performance data added.' }
        format.json { render action: 'show', status: :created, location: @performance }
      else
        format.html { render action: 'new' }
        format.json { render json: @performance.errors, status: :unprocessable_entity }
      end  # if
    end  # do
  end  # create

  # PATCH/PUT /performances/1
  # PATCH/PUT /performances/1.json
  def update
    respond_to do |format|
      if @performance.update(performance_params)
        format.html { redirect_to @performance, notice: 'Performance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @performance.errors, status: :unprocessable_entity }
      end  # if
    end  # do
  end  # update

  # DELETE /performances/1
  # DELETE /performances/1.json
  def destroy
      @performance.destroy if session[:is_owner]
    respond_to do |format|
      format.html { redirect_to design_path(session[:design_id]) }        
      format.json { head :no_content }
    end  # do
  end  # destroy
    
  #############################################################################
  def download
    @attachment = Attachment.find(@performance.attachment_id)
    send_data @attachment.contents, :filename => @attachment.file_name, :type => @attachment.content_type if ! @performance.attachment_id.nil?
  end  # download

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_performance
      @performance = Performance.find(params[:id])
    end  # set_performance

    # Never trust parameters from the scary internet, only allow the white list through.
    def performance_params
      params.require(:performance).permit(:design_id, :attachment_id, :name, :description, :metric, :rating, :updated_at, :datafile)
    end  # performance_params
end  # class
