class RecommendationsController < ApplicationController
  def index
    if params[:color].present?
      @wines = Wine.where(color: params[:color].downcase) &&
      @food_pairings = FoodPairing.where(food_id: params[:food_id])
      @wines = @food_pairings.map do |fp|
        fp.wine
      end
      @recommendations = @wines.select { |wine| wine.color == params[:color].downcase && wine.price.cents <= params[:price].to_i * 100 }
      @wines = Wine.all
      # raise
    else
      @wines = Wine.all
    end
  end
end


# if params[:food_id].present?
    #   @wines.each do |wine|
    #     wine.foods.each do |food|
    #       food.name
    #     end
    #   end
