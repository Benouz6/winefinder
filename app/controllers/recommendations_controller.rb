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

      @top_five.each { |wine| create_inventories(wine) }
    else
      @top_five = Wine.all
    end
  end


  def map
    @wine = Wine.find(params[:id])
    @markers = @wine.inventories.map do |wine|
      {
        lat: wine.latitude,
        lng: wine.longitude
      }
    end
  end

  def create_inventories(wine)
    file = "#{Rails.public_path}/data_json/#{wine.saq_id}.json"
    avails = JSON.parse(File.open(file).read)['list']
    avails.first(3).each do |avail|
      p avail["distance"]
    end
  end

end
