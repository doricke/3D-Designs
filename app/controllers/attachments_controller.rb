class AttachmentsController < ApplicationController
  before_action :set_attachment, only: [:show, :edit, :update, :destroy, :download, :show_img]

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
 
#############################################################################
  # GET /attachments
  # GET /attachments.json
  def index
    @attachments = Attachment.all
    @designs = Design.all
    @designs_hash = Tools::to_hash(@designs)
  end  # index
    
#############################################################################
  # GET /attachments/1
  # GET /attachments/1.json
  def show
    @designs = Design.all
  end  # show

#############################################################################
  # GET /attachments/new
  def new
    @attachment = Attachment.new
    @designs = Design.all
  end  # new

#############################################################################
  # GET /attachments/1/edit
  def edit
    @designs = Design.all
  end  # edit

#############################################################################
  # POST /attachments
  # POST /attachments.json
  def create
    @attachment = Attachment.new(attachment_params)
    @attachment.design_id = session[:design_id]
    @attachment.updated_at = Time::now

    respond_to do |format|
      if @attachment.save
        format.html { redirect_to design_path(session[:design_id]), notice: 'File added.' }
        format.json { render action: 'show', status: :created, location: @attachment }
      else
        @designs = Design.all
        format.html { render action: 'new' }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end  # if
    end  # do
  end  # create

#############################################################################
  # PATCH/PUT /attachments/1
  # PATCH/PUT /attachments/1.json
  def update
    respond_to do |format|
      if @attachment.update(attachment_params)
        @attachment.updated_at = Time::now
        @attachment.save
        format.html { redirect_to @attachment, notice: 'Attachment was successfully updated.' }
        format.json { head :no_content }
      else
        @designs = Design.all
        format.html { render action: 'edit' }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end  # if
    end  # do
  end  # update

#############################################################################
  # DELETE /attachments/1
  # DELETE /attachments/1.json
  def destroy
    @attachment.destroyif session[:is_owner]
    respond_to do |format|
      format.html { redirect_to designs_path(session[:design_id]) }
      format.json { head :no_content }
    end  # do
  end  # destroy
    
#############################################################################
  def download
    puts ">>>>> download called <<<<<<"
    send_data @attachment.contents, :filename => @attachment.file_name, :type => @attachment.content_type
  end  # download
    
#############################################################################
  def show_img
    send_data(@attachment.contents, :type => @attachment.content_type, :disposition => 'inline')
  end  # show_img

#############################################################################
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attachment
      @attachment = Attachment.find(params[:id])
      @owns = true if session[:is_admin]
    end  # set_attachment

#############################################################################
    # Never trust parameters from the scary internet, only allow the white list through.
    def attachment_params
        params.require(:attachment).permit(:design_id, :file_name, :path_name, :description, :file_type, :downloads, :content_type, :updated_at, :contents_bytes, :contents, :view_bytes, :view, :datafile, :save)
    end  # attachment_params
end  # class
