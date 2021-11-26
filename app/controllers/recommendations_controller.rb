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
          address: av['address'].first#.match(/\"(.+)\"/)[1]
          })
        raise
      end
    end

    avails_hash = JSON.parse(wine.availabilities.first.json_file)
    raise
    avails.map do |avail|
      {
        address: avail['address1'],
        qty: avail['qty'].to_i,
        json_file: avails_json
      }
    end
  end
end
