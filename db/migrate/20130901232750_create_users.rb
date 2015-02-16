class CreateUsers < ActiveRecord::Migration

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
    create_table :users do |t|
      t.string :name, :limit => 160
      t.string :email, :limit => 160      
      t.string :hashed_password, :limit => 40
      t.string :salt, :limit => 40 # salting the encyption algorithm.
      t.boolean :is_admin
    end  # do
  end  # change
    
  def self.up
    add_index :users, [:name], :name => :idx_users_name
  end  # up

end  # class
