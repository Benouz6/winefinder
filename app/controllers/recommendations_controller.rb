class RecommendationsController < ApplicationController

  def show
    @wine = Wine.find(params[:id])
  end

  def index
    if params[:color].present?
      top_five_wines = Wine
        .includes(:foods)
        .joins(food_pairings: :food)
        .where(foods: { id: params[:food_id] })
        .where(color: params[:color].downcase)
        .where(price_cents: ..params[:price].to_i * 100)
        .order(price_cents: :desc)
        .order(rating: :desc)
        .limit(5)

      # passing the top five inventories to the index page
      @top_five = top_five_wines.map do |wine|
        create_inventories(wine)
      end

    else
      @top_five = Wine.all
    end
  end

  def map
    # Page should use inventory instance as it stores all the required information
    # @inventory = Inventory.find(params[:id])

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
      i = Inventory.new(
        bottle_count: avail["qty"],
        longitude: avail["longitude"],
        latitude: avail["latitude"],
        name_saq: avail["name"],
        address: avail["address1"],
        distance: avail["distance"]
      )
      i.wine = wine
      i.save
      return i
    end
  end

end
