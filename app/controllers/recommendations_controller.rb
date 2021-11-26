class RecommendationsController < ApplicationController

  def show
    @wine = Wine.find(params[:id])
  end

  def index
    if params[:color].present?
      @wines = Wine.where(color: params[:color].downcase)
      @food_pairings = FoodPairing.where(food_id: params[:food_id])
      @wines = @food_pairings.map do |fp|
        fp.wine
      end
      @recommendations = @wines.select { |wine| wine.color == params[:color].downcase && wine.price.cents <= params[:price].to_i * 100 }
      @top_five = @recommendations.first(5).sort_by { |wine| wine.price }.reverse

      # Show the price near to 50$

    else
      @wines = Wine.all
    end

    def map

    end
  end
end
