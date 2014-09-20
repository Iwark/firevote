class UsersController < ApplicationController

  skip_before_action :user_authenticate!, only: [:create]

  def create
    @user = User.new(user_params)
    ip_address = request.env["HTTP_X_FORWARDED_FOR"] || request.remote_ip
    user = User.find_by(ip_address: ip_address)
    @user = user if user
    if @user.save
      session[:user_id] = @user.id
      redirect_to :main
    else
      render 'welcome/index'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :team_id)
  end

end