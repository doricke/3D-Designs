class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

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
  # GET /images
  # GET /images.json
  def index
    if ! session[:design_id].nil?
      @images = Image.find_all_by_design_id(session[:design_id])
    else
      @images = Image.all
    end  # if
    @designs = Design.all
    @designs_hash = Tools::to_hash(@designs)
  end  # index

#############################################################################
  # GET /images/1
  # GET /images/1.json
  def show
    @design = Design.find(session[:design_id])
  end  # show

#############################################################################
  # GET /images/new
  def new
    @image = Image.new
    @designs = Design.all
  end  # new

#############################################################################
  # GET /images/1/edit
  def edit
    @designs = Design.all
  end  # edit

#############################################################################
  # POST /images
  # POST /images.json
  def create
    @image = Image.new(image_params)
    @image.design_id = session[:design_id]

    respond_to do |format|
      if @image.save
          format.html { redirect_to design_path(session[:design_id]), notice: 'Image uploaded.' }
        format.json { render action: 'show', status: :created, location: @image }
      else
        @designs = Design.all
        format.html { render action: 'new' }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end  # if
    end  # do
  end  # create

#############################################################################
  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { head :no_content }
      else
        @designs = Design.all
        format.html { render action: 'edit' }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end  # if
    end  # do
  end  # update

#############################################################################
  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy if session[:is_owner]
    respond_to do |format|
      format.html { redirect_to design_path(session[:design_id]) }
      format.json { head :no_content }
    end  # do
  end  # destroy
    
    
#############################################################################
  def show_img
    @image = Image.find(params[:id])
    send_data(@image.picture, :type => 'image/png', :disposition => 'inline')
  end  # show_img

  private
#############################################################################
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end  # set_image

#############################################################################
    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
        params.require(:image).permit(:design_id, :image_name, :description, :image_type, :picture_bytes, :picture, :datafile)
    end  # image_params

#############################################################################
end  # class 
