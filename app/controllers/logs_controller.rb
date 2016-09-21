class LogsController < ApplicationController
  before_action :set_user, only: [:index]
  before_action :set_log, only: [:time_in, :time_out]

  def index
    @logs = @user.logs
  end

  def show
  end

  def new
  end

  def create
  end

  def time_out
    if @log.update(time_out: Time.current)
      render 'home/index'
    else
      redirect to: 'home/index'
    end
  end

  private

  def set_user
    @user = User.first
    # @user = current_user
  end

  def set_log
    @log = Log.find(params[:id])
  end
end
