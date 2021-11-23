class RecommendationsController < ApplicationController
  def index
    @wines = Wine.all
  end
end


# Client.where(
#   "created_at > ? AND created_at < ?", params[:start_date], params[:end_date])
