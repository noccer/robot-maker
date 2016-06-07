class UsersController < ApplicationController
  def new_user_form
  end

  def index
  end

  def create_user
    user = User.new(user_params)
    if user.save
      redirect_to '/'
    else
      flash[:errors] = { 'class' => 'error_message', 'message' => user.errors.full_messages }
      redirect_to '/signup'
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :user_firstname)
  end
end
