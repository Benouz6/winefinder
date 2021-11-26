class RecommendationsController < ApplicationController
  def index
    if params[:color].present?
      @wines = Wine.where(color: params[:color].downcase) &&
      @food_pairings = FoodPairing.where(food_id: params[:food_id])
      @wines = @food_pairings.map do |fp|
        fp.wine
      end
      @recommendations = @wines.select { |wine| wine.color == params[:color].downcase && wine.price.cents <= params[:price].to_i * 100 }
      @recommendations.first(5).each { |wine| create_live_availibilities(wine) }
      # raise
    else
      @wines = Wine.all
    end
  end

  def create_live_availibilities(wine)
    wine.availabilities.each do |av|
      list = JSON.parse(av.json_file)['list']

      list.each do |av|
        LiveAvailability.create!({
          wine: wine,
          qty: av['qty'].to_i,
          address: av['address'].first
          })
      end
    end
  end
end
