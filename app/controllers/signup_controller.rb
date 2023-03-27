class SignupController < ApplicationController
  def new
    @user = User.new()
  end

  def create
    if (User.find_by(username: params[:user][:username]))
      redirect_to root_path, alert: "Username already exists. Please try another username."
    else
      @user = User.new(user_params)

      if (@user[:username] == "admin")
        redirect_to root_path, alert: "You can not create Admin account."
      else
        if (@user.save())
          session[:user_id] = @user.id
          redirect_to root_path, notice: "Signed Up successfull."
        else
          render :new, alert: "Unable to Sign Up. Please try again."
        end
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
