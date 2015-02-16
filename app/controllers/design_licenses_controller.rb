class DesignLicensesController < ApplicationController
  before_action :set_design_license, only: [:show, :edit, :update, :destroy]

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
 
  # GET /design_licenses
  # GET /design_licenses.json
  def index
    @design_licenses = DesignLicense.find_all_by_design_id(session[:design_id])
  end  # index

  # GET /design_licenses/1
  # GET /design_licenses/1.json
  def show
  end

  # GET /design_licenses/new
  def new
    @design_license = DesignLicense.new
    @licenses = License.all
  end

  # GET /design_licenses/1/edit
  def edit
  end

  # POST /design_licenses
  # POST /design_licenses.json
  def create
    @design_license = DesignLicense.new(design_license_params)
    @design_license.design_id = session[:design_id]
    @duplicate = DesignLicense.find_by_design_id_and_license_id(@design_license.design_id, @design_license.license_id, :limit => 1)
    @design_license = @duplicate if ! @duplicate.nil?

    respond_to do |format|
      if @design_license.save
        if session[:design_id].nil?
          format.html { redirect_to @design_license, notice: 'License added.' }
        else
            format.html { redirect_to design_path(session[:design_id]), notice: 'License added' }
        end  # if
        format.json { render action: 'show', status: :created, location: @design_license }
      else
        format.html { render action: 'new' }
        format.json { render json: @design_license.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /design_licenses/1
  # PATCH/PUT /design_licenses/1.json
  def update
    respond_to do |format|
      if @design_license.update(design_license_params)
        format.html { redirect_to @design_license, notice: 'Design license was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @design_license.errors, status: :unprocessable_entity }
      end  # if
    end  # do
  end  # update

  # DELETE /design_licenses/1
  # DELETE /design_licenses/1.json
  def destroy
    @design_license.destroy if (@design_license.design_id == session[:design_id])
    respond_to do |format|
      format.html { redirect_to design_path(session[:design_id]) }
      format.json { head :no_content }
    end  # do
  end  # destroy

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_design_license
      @design_license = DesignLicense.find(params[:id])
      @licenses = License.all
      @licenses_hash = Tools::to_hash(@licenses)
    end  # set_design_license

    # Never trust parameters from the scary internet, only allow the white list through.
    def design_license_params
      params.require(:design_license).permit(:design_id, :license_id)
    end  # design_license_params
end  # class
