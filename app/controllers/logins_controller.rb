############################################################################
class LoginsController < ApplicationController
  
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
 
#############################################################################
  def clear_sessions
    session[:user_id] = nil
    session[:user_name] = nil
    session[:is_admin] = false
    session[:design_id] = nil
    session[:is_owner] = nil
  end  # clear_sessions
  
#############################################################################
  # GET /users
  # GET /users.xml
  def index
    clear_sessions
  end  # index  

#############################################################################
  def show
    redirect_to(logins_url)
  end  # show
  
#############################################################################
  def logout
    clear_sessions
    redirect_to(logins_url)
  end  # logout

#############################################################################
  def verify    
    name = params[:name]
    @user = User.find_by_name(name)
    if (@user != nil)
      # Verify the password
      if @user.hashed_password.blank?
        @user.password = params[:password]
        @user.save
      else
        # Validate the given password
        if !@user.verify_password(params[:password])
          flash[:notice] = "Invalid userid/password combination"
          redirect_to(logins_url)
          return
        end  # if
      end  # if
      
      session[:user_id] = @user.id
      session[:user_name] = @user.name
      session[:is_admin] = @user.is_admin

      flash[:notice] = "Welcome #{@user.name}"
      session[:user_name] = @user.name
    
      redirect_to(designs_url)      
      return
    else
      flash[:notice] = "Unknown userid/password combination."
    end  # if
    
    #not found
    flash[:notice] = "Login name '#{name}' was not found."
    redirect_to(logins_url)
  end  # verify
  
#############################################################################
  def reset_password
    @user = User.find(params[:id])
    if @user.hashed_password.blank?
      flash[:notice] = "User's password is blank"
      redirect_to(users_path)
    else
      @user.hashed_password = ""
      @user.save
      flash[:notice] = "Password was successfuly reset"
      redirect_to(users_path)
    end # If
  end # reset_password

#############################################################################
end  # class LoginsController
