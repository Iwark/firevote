class UsersController < ApplicationController

  skip_before_action :user_authenticate!, only: [:create]

  def create
    @user = User.new(user_params)
    remoteaddr = 'unknown'

    if request.env['HTTP_X_FORWARDED_FOR']
      remoteaddr = request.env['HTTP_X_FORWARDED_FOR'].split(",")[0]
    else
      remoteaddr = request.env['REMOTE_ADDR'] if request.env['REMOTE_ADDR']
    end
    ip_address = remoteaddr
    user = User.find_by(ip_address: remoteaddr)
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