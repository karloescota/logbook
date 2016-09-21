class HomeController < ApplicationController
  before_action :authenticate_user!

  before_action :set_user
  before_action :set_current_log

  def index
  end

  private

  def set_user
    @user = current_user
  end

  def set_current_log
    @log = @user.logs.current_log
  end
end
