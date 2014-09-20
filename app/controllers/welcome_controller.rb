class WelcomeController < ApplicationController

  skip_before_action :user_authenticate!
  before_action :welcome_redirect!

  def index
    @user = User.new
  end

  private
  def welcome_redirect!
    redirect_to :main if current_user
  end

end