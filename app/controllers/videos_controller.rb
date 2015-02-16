class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy, :download, :show_video]

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
  # GET /videos
  # GET /videos.json
  def index
    puts "##### session[:design_id] = #{session[:design_id]}"
    @videos = Video.find_all_by_design_id(session[:design_id])
  end  # index

#############################################################################
  # GET /videos/1
  # GET /videos/1.json
  def show
  end

#############################################################################
  # GET /videos/new
  def new
    @video = Video.new
  end

#############################################################################
  # GET /videos/1/edit
  def edit
  end

#############################################################################
  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(video_params)
    @video.design_id = session[:design_id]
    @video.updated_at = Time::now

    respond_to do |format|
      if @video.save
          format.html { redirect_to design_path(session[:design_id]), notice: 'Video added.' }
        format.json { render action: 'show', status: :created, location: @video }
      else
        format.html { render action: 'new' }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

#############################################################################
  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

#############################################################################
  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy if session[:is_owner]
    respond_to do |format|
      format.html { redirect_to design_path(session[:design_id]) }
      format.json { head :no_content }
    end
  end
    
#############################################################################
  def download
    send_data @video.movie, :filename => @attachment.video_name, :type => @video.video_type
  end  # download
    
#############################################################################
  def show_video
    send_data(@video.movie, :type => @video.video_type, :disposition => 'inline', :stream => true)
  end  # show_video

  private
#############################################################################
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

#############################################################################
    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
        params.require(:video).permit(:design_id, :video_name, :video_description, :video_category, :video_type, :video_bytes, :movie, :updated_at, :datafile, :views)
    end
end
