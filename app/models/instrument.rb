class Instrument < ActiveRecord::Base
    
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
 
  validates_presence_of :instrument_type_id
  validates_presence_of :instrument_name
    
####################################################################################################
  def datafile=(input_data)
    return nil if input_data == "" #no file name was entered
    image = Image.new
    image.image_name = input_data.original_filename
    image.image_type = input_data.content_type.chomp
    image.image_use = 'Instrument'
    image.picture = input_data.read
    # self.picture_byte = self.picture.size
    image.save
    self.image_id = image.id
  end  # datafile=
    
####################################################################################################
end  # Instrument
