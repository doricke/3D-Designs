class Attachment < ActiveRecord::Base

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
 
  belongs_to :design
  
  has_one :attachment
  has_one :performance
    
  # validates_presence_of :file_name  # old style
  validates :file_name, {:presence => true}
  
####################################################################################################
def datafile=(input_data)
  datafile(input_data)
end  # datafile=

####################################################################################################
def datafile(input_data)
    return nil if input_data == "" #no file name was entered
    # self.file_name = base_part_of(input_data.original_filename)
    self.file_name = input_data.original_filename
    self.path_name = input_data.original_filename
    self.content_type = input_data.content_type.chomp
    self.contents = input_data.read
    self.view = self.contents
end  # datafile
    
####################################################################################################
def base_part_of(file_name)
    File.basename(file_name).gsub(/[^\w._-]/, '')
end  # base_part_of
    
####################################################################################################
end  # Attachment
