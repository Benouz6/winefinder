class RecommendationsController < ApplicationController

  def show
    @wine = Wine.find(params[:id])
  end

  def index
    if params[:color].present?
      @top_five = Wine
        .includes(:foods)
        .joins(food_pairings: :food)
        .where(foods: { id: params[:food_id] })
        .where(color: params[:color].downcase)
        .where(price_cents: ..params[:price].to_i * 100)
        .order(price_cents: :desc)
        .order(rating: :desc)
        .limit(5)
      @top_rated = @top_five.each do |tf|
        p create_inventories(tf)
      end
    else
      @top_five = Wine.all
    end

    def map

    end
  end
end
