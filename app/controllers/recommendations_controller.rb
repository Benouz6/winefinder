class RecommendationsController < ApplicationController
  def index
    @wines = Wine.all
    if params[:color].present?
      @wines = Wine.where(color: params[:color].downcase)
    #   params[:price].present?
    #   @wines = Wine.where("price <= ?", params[:price].to_i)
    # else
    #   @wines = Wine.all
    end
  end
end


# if params[:food_id].present?
    #   @wines.each do |wine|
    #     wine.foods.each do |food|
    #       food.name
    #     end
    #   end
