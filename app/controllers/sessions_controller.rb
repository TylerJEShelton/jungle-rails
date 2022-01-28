class SessionsController < ApplicationController
  def new
  end

  def create
    # use strip and downcase on the input from the form to remove leading and trailing whitespace as well as make everything lowercase as the email is case insensitive
    email = params[:email].downcase.strip
    @user = User.find_by_email(email)
    if @user && @user.authenticate_with_credentials(email,params[:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end
  
end
