class RecommendationsController < ApplicationController
  def index
    if params[:color].present?
      @wines = Wine.where("color = ?", params[:color]) &&
      params[:price].present?
      @wines = Wine.where("price <= ?", params[:price].to_i)
    else
      @wines = Wine.all
    end
  end
end
