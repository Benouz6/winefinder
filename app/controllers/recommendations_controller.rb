require 'open-uri'

class RecommendationsController < ApplicationController

  def show
    @wine = Wine.find(params[:id])
  end

  def index

    # get coordinates from user address
    # test with 5333, avenue casgrain, montreal
    address = params[:address]
    coords = Geocoder.search(address).first.coordinates
    latitude = coords[0]
    longitude = coords[1]

    # get closest stores with SAQ API call
    url = "https://www.saq.com/en/store/locator/ajaxlist/?loaded=0&latitude=#{latitude}&longitude=#{longitude}&_=1638314430766"
    json = URI.open(url, { 'x-requested-with' => 'XMLHttpRequest' }).read








    raise





    raise
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
    @inventory = Inventory.find(params[:id])

    @markers = [{ lat: @inventory.latitude, lng: @inventory.longitude }]

    # Multiple markers:
    # @wine = @inventory.wine
    # @markers = @wine.inventories.map do |wine|
    #   {
    #     lat: wine.latitude,
    #     lng: wine.longitude
    #   }
    # end
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
