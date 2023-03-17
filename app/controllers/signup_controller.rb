class SignupController < ApplicationController
  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)

    if (@user.save())
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Signed Up successfull."
    else
      render :new, alert: "Unable to Sign Up. Please try again."
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
