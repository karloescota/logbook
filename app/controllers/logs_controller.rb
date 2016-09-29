class LogsController < ApplicationController
  before_action :set_log, only: [:edit, :update, :destroy, :time_out]

  def index
    @logs = current_user.logs
  end

  def new
    @log = Log.new
  end

  def create
    time_in = DateTime.strptime("#{params[:log][:time_in]} +8", '%H:%M %m/%d/%y %z')
    time_out = DateTime.strptime("#{params[:log][:time_out]} +8", '%H:%M %m/%d/%y %z') if params[:log][:time_out].present?
    @log = current_user.logs.build(time_in: time_in, time_out: time_out)
    if @log.save
      flash[:notice] = 'Log added'
    else
      flash[:alert] = @log.errors.full_messages.to_sentence
    end
    redirect_to root_path
  end

  def edit
  end

  def update
    time_in = DateTime.strptime("#{params[:log][:time_in]} +8", '%H:%M %m/%d/%y %z')
    time_out = DateTime.strptime("#{params[:log][:time_out]} +8", '%H:%M %m/%d/%y %z') if params[:log][:time_out].present?
    if @log.update(time_in: time_in, time_out: time_out)
      flash[:notice] = 'Log updated'
    else
      flash[:alert] = @log.errors.full_messages.to_sentence
    end
    redirect_to root_path
  end

  def destroy
    if @log.destroy
      flash[:notice] = 'Log deleted'
    else
      flash[:alert] = @log.errors.full_messages.to_sentence
    end
    redirect_to root_path
  end

  def time_in
    @log = current_user.logs.build(time_in: Time.current)
    if @log.save
      flash[:notice] = 'Timed in'
    else
      flash[:alert] = @log.errors.full_messages.to_sentence
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

  def log_params
    params.require(:log).permit(:time_in, :time_out)
  end
end
