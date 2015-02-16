class Video < ActiveRecord::Base
    
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
    
  validates_presence_of :design_id
  validates_presence_of :video_name
  validates_presence_of :video_bytes
  validates_presence_of :updated_at
    
####################################################################################################
def datafile=(input_data)
    puts "###### Video loaded"
    return nil if input_data == "" #no file name was entered
    self.video_name = input_data.original_filename
    self.video_category = "video"
    # self.views = 0
    self.video_type = input_data.content_type.chomp
    self.movie = input_data.read
    self.video_bytes = self.movie.size
    self.updated_at = Time::now
  end  # datafile
    
####################################################################################################

end  # Video
