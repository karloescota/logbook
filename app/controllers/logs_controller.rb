class LogsController < ApplicationController
  before_action :set_log, only: [:time_in, :time_out]

  def index
    @logs = current_user.logs
  end

  def time_in
    if @log.update(time_in: Time.current)
      flash[:notice] = 'Time in updated'
    else
      flash[:alert] = 'Unable to update time in'
    end
    redirect_to root_path
  end

  def time_out
    if @log.update(time_out: Time.current)
      flash[:notice] = 'Time out updated'
    else
      flash[:alert] = 'Unable to update time out'
    end
    redirect_to root_path
  end

  private

  def set_log
    @log = Log.find(params[:id])
  end
end
