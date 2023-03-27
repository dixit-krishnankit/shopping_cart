class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])

    if (user.present? && user.authenticate(params[:password]))
      session[:user_id] = user.id
      if (user[:username] == "admin")
        redirect_to admin_path, notice: "Signed In successfully."
      else
        redirect_to root_path, notice: "Signed In successfully."
      end
    else
      redirect_to signin_path, alert: "Invalid Username or Password"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged Out"
  end
end
