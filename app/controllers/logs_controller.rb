class LogsController < ApplicationController
  before_action :set_log, only: [:time_out]

  def index
    @logs = current_user.logs
  end

  def create
    @log = current_user.logs.build(log_params)
    if @log.save
    else
    end
    redirect_to root_path
  end

  # def time_in
  #   @log = Log.new(time_in: Time.current)
  #   if @log.save
  #     flash[:notice] = 'Time in updated'
  #   else
  #     flash[:alert] = @log.errors.full_messages.to_sentence
  #   end
  #   redirect_to root_path
  # end

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

  def log_params
    params.permit(:time_in, :time_out)
  end
end
