class AttributesController < ApplicationController
  before_action :set_attribute, only: [:show, :edit, :update, :destroy]

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
 
  # GET /attributes
  # GET /attributes.json
  def index
    @attributes = Attribute.all
  end

  # GET /attributes/1
  # GET /attributes/1.json
  def show
  end

  # GET /attributes/new
  def new
    @attribute = Attribute.new
  end

  # GET /attributes/1/edit
  def edit
  end

  # POST /attributes
  # POST /attributes.json
  def create
    @attribute = Attribute.new(attribute_params)

    respond_to do |format|
      if @attribute.save
        format.html { redirect_to @attribute, notice: 'Attribute was successfully created.' }
        format.json { render action: 'show', status: :created, location: @attribute }
      else
        format.html { render action: 'new' }
        format.json { render json: @attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attributes/1
  # PATCH/PUT /attributes/1.json
  def update
    respond_to do |format|
      if @attribute.update(attribute_params)
        format.html { redirect_to @attribute, notice: 'Attribute was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attributes/1
  # DELETE /attributes/1.json
  def destroy
    @attribute.destroy
    respond_to do |format|
      format.html { redirect_to attributes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attribute
      @attribute = Attribute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attribute_params
      params.require(:attribute).permit(:attribute_name)
    end
end
