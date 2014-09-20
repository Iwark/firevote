class MainController < ApplicationController
  def index
    @user = current_user
    @vote = Vote.new
  end
end