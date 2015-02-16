class Image < ActiveRecord::Base

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
    
  validates_presence_of :image_name
  validates_presence_of :image_type

#############################################################################
def self.load_image(design_id, image_name, image_use, image_type, description)
  in_file = InputFile.new('public/images/' + image_name)
  in_file.open_file
  picture = in_file.read_binary
  in_file.close_file

  image = Image.new
  image.design_id = design_id
  image.image_name = image_name
  image.image_use = image_use
  image.image_type = image_type
  image.description = description
  image.picture_bytes = picture.size

  if ! picture.nil?
    image.picture = picture
    image.save
    return image.id
  end  # if

  return 0  # no image loaded
end  # load_image

#############################################################################
def datafile=(input_data)
    puts "Attachment.datafile= called"
    datafile(input_data)
end  # datafile=

####################################################################################################
def datafile(input_data)
    puts "Image.datafile called"
    puts "input_data is nil" if input_data.nil? || (input_data == "")
    return nil if input_data == "" #no file name was entered
    self.image_name = input_data.original_filename
    puts "File name: " + input_data.original_filename
    self.image_type = input_data.content_type.chomp
    self.picture = input_data.read
    # self.picture_byte = self.picture.size
end  # datafile

####################################################################################################
def base_part_of(file_name)
    File.basename(file_name).gsub(/[^\w._-]/, '')
end  # base_part_of

#############################################################################

end  # Image
