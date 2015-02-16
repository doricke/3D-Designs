require 'digest/sha1'

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
 
class User < ActiveRecord::Base
   
  has_many :comment
  has_many :design
  has_many :member
  has_many :used
    
  validates_presence_of :name
    
#############################################################################   
def password
  @password
end  # method password
    
    
#############################################################################
def password=(pwd)
  @password = pwd
  create_new_salt
  self.hashed_password = encrypted_password(self.password, self.salt)
end  # method password=
    
    
#############################################################################
def authenticate(user521, password)
  user = self.find_by_user521(user521)
    if user
        expected_password = encrypted_password(password, user.salt)
        if user.hashed_password != expected_password
            user = nil
        end  # if
    end  # if
  user
end  # method authenticate
    
    
#############################################################################
def verify_password(password)
    expected_password = encrypted_password(password, self.salt)
    if self.hashed_password != expected_password
        return false
    end  # if
    return true
end  # method verify_password
    
    
#############################################################################
private
    
    
#############################################################################
def create_new_salt
  self.salt = self.object_id.to_s + rand.to_s
end  # method create_new_salt
    
    
#############################################################################
def encrypted_password(password, salt)
  string_to_hash = password + "salad" + salt
  Digest::SHA1.hexdigest(string_to_hash)
end  # method encrypted_password
end  # User
