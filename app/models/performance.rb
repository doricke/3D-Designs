class Performance < ActiveRecord::Base
  
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
 
  belongs_to :attachment
  belongs_to :design
    
  validates_presence_of :design_id
  validates_presence_of :name
  validates_presence_of :updated_at
    
####################################################################################################
  def datafile=(input_data)
    puts "###### Performance attachment loaded"
    return nil if input_data == "" #no file name was entered
    attachment = Attachment.new
    attachment.file_name = input_data.original_filename
    attachment.path_name = input_data.original_filename
    attachment.description = ""
    attachment.file_type = "software"
    attachment.downloads = 0
    attachment.content_type = input_data.content_type.chomp
    attachment.contents = input_data.read
    attachment.view = attachment.contents
    attachment.updated_at = Time::now
    attachment.save
    self.attachment_id = attachment.id
  end  # datafile

####################################################################################################
end  # Performance
