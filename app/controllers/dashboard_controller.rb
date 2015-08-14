class DashboardController < ApplicationController
  def index
    targets = Log.group('location_id').maximum('created_at').values
    @current_logs = Log.where(created_at: targets)
  end
end
