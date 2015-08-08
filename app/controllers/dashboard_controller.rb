class DashboardController < ApplicationController
  def index
    @log = Log.last(1).first
  end
end
