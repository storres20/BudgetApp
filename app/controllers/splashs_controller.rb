class SplashsController < ApplicationController
  before_action :authenticate_login!

  def index; end

  def show; end

  def authenticate_login!
    return unless user_signed_in?

    redirect_to groups_path
  end
end
