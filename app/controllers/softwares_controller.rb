class SoftwaresController < ApplicationController
  before_action :set_software, only: [:show, :edit, :update, :destroy, :download]

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
 
  # GET /softwares
  # GET /softwares.json
  def index
    @softwares = Software.find_all_by_design_id(session[:design_id])
  end  # index

  # GET /softwares/1
  # GET /softwares/1.json
  def show
    @attachment = Attachment.find(@software.attachment_id) if ! @software.attachment_id.nil?
  end  # show

  # GET /softwares/new
  def new
    @software = Software.new
  end

  # GET /softwares/1/edit
  def edit
  end

  # POST /softwares
  # POST /softwares.json
  def create
    @software = Software.new(software_params)
    @software.design_id = session[:design_id]
    @attachment = Attachment.find(@software.attachment_id)
    @attachment.description = @software.description
    @attachment.save

    respond_to do |format|
      if @software.save
        format.html { redirect_to design_path(session[:design_id]), notice: 'Software was successfully added.' }
        format.json { render action: 'show', status: :created, location: @software }
      else
        format.html { render action: 'new' }
        format.json { render json: @software.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /softwares/1
  # PATCH/PUT /softwares/1.json
  def update
    respond_to do |format|
      if @software.update(software_params)
        format.html { redirect_to @software, notice: 'Software was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @software.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /softwares/1
  # DELETE /softwares/1.json
  def destroy
      @software.destroy if session[:is_owner]
    respond_to do |format|
      format.html { redirect_to design_path(session[:design_id]) }
      format.json { head :no_content }
    end
  end
    
  #############################################################################
  def download
    @attachment = Attachment.find(@software.attachment_id)
    send_data @attachment.contents, :filename => @attachment.file_name, :type => @attachment.content_type if ! @software.attachment_id.nil?
  end  # download

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_software
      @software = Software.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def software_params
      params.require(:software).permit(:design_id, :attachment_id, :software_name, :description, :datafile)
    end
end
