class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

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
 
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.find_all_by_design_id(session[:design_id])
    @users = User.all
    @users_hash = Tools::to_hash(@users)
  end  # index

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end  # new

  # GET /comments/1/edit
  def edit
  end  # edit

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = session[:user_id]
    @comment.design_id = session[:design_id]
    @comment.updated_at = Time::now

    respond_to do |format|
      if @comment.save
          format.html { redirect_to design_path(session[:design_id]), notice: 'Comment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @comment }
      else
        format.html { render action: 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end  # if
    end  # do
  end  # create

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy if (@comment.user_id == session[:user_id])
    respond_to do |format|
      format.html { redirect_to design_path(session[:design_id]) }
      format.json { head :no_content }
    end  # do
  end  # destroy

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
      @owns = (session[:user_id] == @comment.user_id) if ! @comment.nil?
      @owns = true if session[:is_admin]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:design_id, :user_id, :rating, :updated_at, :comments)
    end
end
