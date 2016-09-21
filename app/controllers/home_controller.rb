class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @log = current_user.logs.current_log
  end
end
