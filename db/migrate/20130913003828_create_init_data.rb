class CreateInitData < ActiveRecord::Migration

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
 
  def self.up
    
    admin = User.create(:name => "Admin", :email => "", :is_admin => true)
    
    micro = Team.create(:team_name => "3D Designs")
    
    Member.create(:team_id => micro.id, :user_id => admin.id, :role => "Member")
    
    printer_3d = InstrumentType.create(:category => "3D Printer")
    
    touch_image_id = Image.load_image(nil, '3DTouch_3D.png', 'instrument', 'png', '3D Touch 3D')
    puts "touch_image: #{touch_image_id}"
    
    puts "Instruments:"
    cube = Instrument.create(:instrument_type_id => printer_3d.id, :instrument_name => "3D Systems Cube 3D Printer", :instrument_model => "2nd Gen, Silver" )
    touch = Instrument.create(:image_id => touch_image_id, :instrument_type_id => printer_3d.id, :instrument_name => "3D Touch 3D Printer", :instrument_model => "3D" )
    
    puts "Licenses:"
    gnu3 = License.create(:license_name => "The GNU General Public License", :license_version => "3.0", :license_url => "http://www.gnu.org/licenses/gpl.html" )
    gnu2 = License.create(:license_name => "GNU General Public License", :license_version => "2", :license_url => "http://www.gnu.org/licenses/gpl-2.0.html" )
    gnu21 = License.create(:license_name => "GNU Lesser General Public License", :license_version => "2.1", :license_url => "http://www.gnu.org/licenses/lgpl-2.1.html" )
    mitl = License.create(:license_name => "The MIT License (MIT)", :license_version => "1", :license_url => "http://opensource.org/licenses/MIT" )
    bsd2 = License.create(:license_name => "The BSD 2-Clause License", :license_version => "1", :license_url => "http://opensource.org/licenses/BSD-2-Clause" )
  end  # up

  def self.down
  end  # down

end  # CreateInitData
