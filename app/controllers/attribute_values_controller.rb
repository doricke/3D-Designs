class AttributeValuesController < ApplicationController
  before_action :set_attribute_value, only: [:show, :edit, :update, :destroy]

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
 
  # GET /attribute_values
  # GET /attribute_values.json
  def index
    # @attribute_values = AttributeValue.all
    @attribute_values = AttributeValue.find_all_by_design_id(session[:design_id])
    @attributes = Attribute.all
    @attributes_hash = Tools::to_hash(@attributes)
  end  # index

  # GET /attribute_values/1
  # GET /attribute_values/1.json
  def show
  end

  # GET /attribute_values/new
  def new
    @attribute_value = AttributeValue.new
    @attributes = Attribute.all
  end  # new

  # GET /attribute_values/1/edit
  def edit
  end

  # POST /attribute_values
  # POST /attribute_values.json
  def create
    @attribute_value = AttributeValue.new(attribute_value_params)
    @attribute_value.design_id = session[:design_id]

    respond_to do |format|
      if @attribute_value.save
        format.html { redirect_to @attribute_value, notice: 'Attribute value was successfully created.' }
        format.json { render action: 'show', status: :created, location: @attribute_value }
      else
        format.html { render action: 'new' }
        format.json { render json: @attribute_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attribute_values/1
  # PATCH/PUT /attribute_values/1.json
  def update
    respond_to do |format|
      if @attribute_value.update(attribute_value_params)
        format.html { redirect_to @attribute_value, notice: 'Attribute value was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @attribute_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attribute_values/1
  # DELETE /attribute_values/1.json
  def destroy
    @attribute_value.destroy
    respond_to do |format|
      format.html { redirect_to attribute_values_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attribute_value
      @attribute_value = AttributeValue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attribute_value_params
      params.require(:attribute_value).permit(:design_id, :attribute_id, :attribute_type, :attribute_int, :attribute_float, :attribute_string, :attribute_boolean)
    end
end
