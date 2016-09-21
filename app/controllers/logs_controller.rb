class LogsController < ApplicationController
  before_action :set_user

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
  end

  private

  def set_user
    @user = User.first
    # @user = current_user
  end
end
