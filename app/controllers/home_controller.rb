class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @log = current_user.current_log || Log.new
  end
end
