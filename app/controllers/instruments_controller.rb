class InstrumentsController < ApplicationController
  before_action :set_instrument, only: [:show, :edit, :update, :destroy]

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
 
  def get_refs
    @instrument_types = InstrumentType.all
    @instrument_types_hash = Tools.to_hash(@instrument_types)
    session[:is_owner] = nil
    session[:design_id] = nil
  end  # get_refs

  # GET /instruments
  # GET /instruments.json
  def index
    @instruments = Instrument.all
    get_refs
  end  # index

  # GET /instruments/1
  # GET /instruments/1.json
  def show
    get_refs
  end

  # GET /instruments/new
  def new
    @instrument = Instrument.new
    get_refs
  end

  # GET /instruments/1/edit
  def edit
    get_refs
  end

  # POST /instruments
  # POST /instruments.json
  def create
    @instrument = Instrument.new(instrument_params)

    respond_to do |format|
      if @instrument.save
        format.html { redirect_to @instrument, notice: 'Instrument was successfully created.' }
        format.json { render action: 'show', status: :created, location: @instrument }
      else
        get_refs
        format.html { render action: 'new' }
        format.json { render json: @instrument.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instruments/1
  # PATCH/PUT /instruments/1.json
  def update
    respond_to do |format|
      if @instrument.update(instrument_params)
        format.html { redirect_to @instrument, notice: 'Instrument was successfully updated.' }
        format.json { head :no_content }
      else
        get_refs
        format.html { render action: 'edit' }
        format.json { render json: @instrument.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instruments/1
  # DELETE /instruments/1.json
  def destroy
    @instrument.destroy if session[:is_admin]
    respond_to do |format|
      format.html { redirect_to instruments_url }
      format.json { head :no_content }
    end  # do
  end  # destroy

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instrument
      @instrument = Instrument.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instrument_params
      params.require(:instrument).permit(:instrument_type_id, :instrument_name, :instrument_model, :datafile)
    end
end
