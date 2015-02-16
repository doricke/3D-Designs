class CreateAttributeValues < ActiveRecord::Migration

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
    create_table :attribute_values do |t|
      t.integer :design_id
      t.integer :attribute_id
      t.string :attribute_type, :limit => 40
      t.integer :attribute_int
      t.float :attribute_float
      t.string :attribute_string, :limit => 80
      t.boolean :attribute_boolean
    end
  end
    
  def self.up
    add_index :attribute_values, [:design_id], :name => :idx_attribute_design
  end  # up

end
