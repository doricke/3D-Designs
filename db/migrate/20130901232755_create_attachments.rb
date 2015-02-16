class CreateAttachments < ActiveRecord::Migration

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
    create_table :attachments do |t|
      t.integer :design_id
      t.string :file_name, :limit => 160
      t.string :path_name, :limit => 160
      t.string :description, :limit => 160
      t.string :file_type, :limit => 40
      t.integer :downloads
      t.string :content_type, :limit => 80
      t.datetime :updated_at
      t.integer :contents_bytes
      t.binary :contents
      t.integer :view_bytes
      t.text :view
    end
  end
    
  def self.up
    add_index :attachments, [:design_id], :name => :idx_attachments_design
  end  # up

end
