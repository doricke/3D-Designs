
#############################################################################
class DesignsController < ApplicationController
  before_action :set_design

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
  # GET /designs
  # GET /designs.json
  def index
    @teams = Team.all
    @teams_hash = Tools.to_hash(@teams)
    @users = User.all
    @users_hash = Tools.to_hash(@users)
    @instruments = Instrument.all
    @instruments_hash = Tools.to_hash(@instruments)
    @designs = Design.all
    session[:design_id] = nil
    session[:is_owner] = nil
    session[:team_id] = nil
  end  # index

#############################################################################
  # GET /designs/1
  # GET /designs/1.json
  def show
    @design.views += 1  # Update the number of views
    @design.save
      
    @users = User.all
    @users_hash = Tools.to_hash(@users)
    @images = Image.find_all_by_design_id(@design.id)
    @licenses = License.all
    @licenses_hash = Tools.to_hash(@licenses)
    @design_licenses = DesignLicense.find_all_by_design_id(@design.id)
    @comments = Comment.find_all_by_design_id(@design.id)
    @comments_hash = Tools.to_hash(@comments)
    @team = nil
    @team = Team.find(@design.team_id) if ! @design.team_id.nil?
    @instrument = Instrument.find(@design.instrument_id)
    @papers = Paper.find_all_by_design_id(@design.id)
    @performances = Performance.find_all_by_design_id(@design.id)
    @softwares = Software.find_all_by_design_id(@design.id)
    @attachments = Attachment.find_all_by_design_id(@design.id)
    @videos = Video.find_all_by_design_id(@design.id)
    @useds = Used.find_all_by_design_id(@design.id)
    @deriveds = Derived.find_all_by_design_id(@design.id)
    @attributes = Attribute.all
    @attributes_hash = Tools.to_hash(@attributes)
    @attribute_values = AttributeValue.find_all_by_design_id(@design.id)
    session[:design_id] = @design.id
    session[:team_id] = @design.team_id
  end  # show

#############################################################################
  # GET /designs/new
  def new
    @design = Design.new
  end  # new

#############################################################################
  # GET /designs/1/edit
  def edit
  end  # edit

#############################################################################
  # POST /designs
  # POST /designs.json
  def create
    @design = Design.new(design_params)
    @design.user_id = session[:user_id]
    @design.views = 0
    @design.downloads = 0
    @design.created_at = Time::now
    @design.updated_at = Time::now

    respond_to do |format|
      if @design.save
        format.html { redirect_to @design, notice: 'Design was successfully created.' }
        format.json { render action: 'show', status: :created, location: @design }
      else
        format.html { render action: 'new' }
        format.json { render json: @design.errors, status: :unprocessable_entity }
      end  # if
    end  # do
  end  # create

#############################################################################
  # PATCH/PUT /designs/1
  # PATCH/PUT /designs/1.json
  def update
    #  @design.updated_at = Time::now
    respond_to do |format|
      if @design.update(design_params)
        format.html { redirect_to @design, notice: 'Design was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @design.errors, status: :unprocessable_entity }
      end  # if
    end  # do
  end  # update

#############################################################################
  # DELETE /designs/1
  # DELETE /designs/1.json
  def destroy
    if session[:is_owner]
      @design.destroy
      respond_to do |format|
        format.html { redirect_to designs_url }
        format.json { head :no_content }
      end  # do
    end # if
  end  # destroy

  private
#############################################################################
    # Use callbacks to share common setup or constraints between actions.
    def set_design
      @users = User.all
      @users_hash = Tools.to_hash(@users)
      @instruments = Instrument.all
      @instruments_hash = Tools.to_hash(@instruments)
      @designs = Design.all
      @design = Design.find(params[:id]) if ! params[:id].nil?
      @teams = Team.all
      @teams_hash = Tools.to_hash(@teams)
      @members = Member.find_all_by_user_id(session[:user_id]) if ! session[:user_id].nil? 
      session[:is_owner] = (session[:user_id] == @design.user_id) if ! @design.nil?
      session[:is_owner] = true if session[:is_admin]
    end  # set_design

#############################################################################
    # Never trust parameters from the scary internet, only allow the white list through.
    def design_params
      params.require(:design).permit(:user_id, :team_id, :instrument_id, :design_name, :revision, :rating, :views, :downloads, :created_at, :updated_at)
    end  # design_params
    #############################################################################
end  # class
