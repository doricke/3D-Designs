class Design < ActiveRecord::Base

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
 
  belongs_to :instrument
  belongs_to :team
  belongs_to :user
    
  has_many :attachment
  has_many :attribute_value
  has_many :comment
  has_many :derived
  has_many :design_license
  has_many :license, :through => :design_license
  has_many :image
  has_many :link
  has_many :paper
  has_many :performance
  has_many :software
  has_many :used
  has_many :video
    
  validates_presence_of :user_id
  validates_presence_of :design_name
  validates_presence_of :views
  validates_presence_of :downloads
  validates_presence_of :created_at
  validates_presence_of :updated_at

end  # Design
