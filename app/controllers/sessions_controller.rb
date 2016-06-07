class SessionsController < ApplicationController
  def create
    # check if user logging in.
    user = User.find_by_username(params[:username])
    #check if a user exists
    if user
      # check if the user has had their password authenticated
      if user.authenticate(params[:password])
        # set the session id to that of the user who has just logged in
        session[:user_id] = user.id
      else
        # show up an error
        flash[:error] = "There was a problem logging in"
      end
    else
      flash[:error] = "No user found with this username"
    end
    redirect_to root_path
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
