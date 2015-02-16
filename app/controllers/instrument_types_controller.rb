class InstrumentTypesController < ApplicationController
  before_action :set_instrument_type, only: [:show, :edit, :update, :destroy]

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
 
  # GET /instrument_types
  # GET /instrument_types.json
  def index
    @instrument_types = InstrumentType.all
    session[:is_owner] = nil
    session[:design_id] = nil
  end  # index

  # GET /instrument_types/1
  # GET /instrument_types/1.json
  def show
  end

  # GET /instrument_types/new
  def new
    @instrument_type = InstrumentType.new
  end

  # GET /instrument_types/1/edit
  def edit
  end

  # POST /instrument_types
  # POST /instrument_types.json
  def create
    @instrument_type = InstrumentType.new(instrument_type_params)

    respond_to do |format|
      if @instrument_type.save
        format.html { redirect_to @instrument_type, notice: 'Instrument type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @instrument_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @instrument_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instrument_types/1
  # PATCH/PUT /instrument_types/1.json
  def update
    respond_to do |format|
      if @instrument_type.update(instrument_type_params)
        format.html { redirect_to @instrument_type, notice: 'Instrument type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @instrument_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instrument_types/1
  # DELETE /instrument_types/1.json
  def destroy
    @instrument_type.destroy if session[:is_admin]
    respond_to do |format|
      format.html { redirect_to instrument_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instrument_type
      @instrument_type = InstrumentType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instrument_type_params
      params.require(:instrument_type).permit(:category)
    end
end
