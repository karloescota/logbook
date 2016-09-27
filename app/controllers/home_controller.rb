class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @log = current_user.current_log || Log.new
    @current_week_logs = current_user.current_week_logs
  end
end
