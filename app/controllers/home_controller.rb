class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @log = current_user.current_log || Log.new
    @current_week_logs = current_user.current_week_logs
    @weekly_progress_value = current_user.current_week_total_time > 162000 ? 162000 : current_user.current_week_total_time
    @daily_progress_value = @log.total_time > 32400 ? 32400 : @log.total_time
  end
end
