class CreateLicenses < ActiveRecord::Migration

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
 
  def change
    create_table :licenses do |t|
      t.string :license_name, :limit => 80
      t.string :license_version, :limit => 32
      t.string :license_url, :limit => 200
    end
  end
    
  def self.up
    add_index :licenses, [:license_name], :name => :idx_licenses_name
  end  # up

end
