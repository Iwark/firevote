class UsersController < ApplicationController

  skip_before_action :user_authenticate!, only: [:create]

  def create
    @user = User.new(user_params)

    remoteaddr = request.remote_ip
    ip_address = remoteaddr
    user = User.find_by(name: user_params[:name])
    if user
      @user = user
    else
      @user.ip_address = ip_address
    end
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