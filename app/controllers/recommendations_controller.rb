require 'open-uri'

class RecommendationsController < ApplicationController

  def index
    # redirects back to form page in case address is missing (avoids crash!)
    if params[:address].blank?
      redirect_to controller: :pages, action: :search and return
    end

    # fetch required instances:
    stores = get_closest_stores(params)
    wines = get_best_wines(params)

    raise
  end

  def map
    @inventory = Inventory.find(params[:id])
    @markers = [{ lat: @inventory.latitude, lng: @inventory.longitude }]
  end

  private

  def get_best_wines(params)
    top_wines = Wine
                .includes(:foods)
                .joins(food_pairings: :food)
                .where(foods: { id: params[:food_id] })
                .where(color: params[:color].downcase)
                .where(price_cents: ..params[:price].to_i * 100)
                .order(price_cents: :desc)
                .order(rating: :desc)
                .limit(5)
    return top_wines
  end

  def get_closest_stores(params)
    # get coordinates from user address
    coords = Geocoder.search(params[:address]).first.coordinates
    coordinates = { latitude: coords[0],
                    longitude: coords[1] }

    # get closest stores with SAQ API call
    find_stores_url = "https://www.saq.com/en/store/locator/ajaxlist/?loaded=0&latitude=#{coordinates[:latitude]}&longitude=#{coordinates[:longitude]}&_=1638314430766" # thank god for this, thanks SAQ
    json = URI.open(find_stores_url, { 'x-requested-with' => 'XMLHttpRequest' }).read
    results = JSON.parse(json)['list']

    # return list of store instances
    create_stores(results)
  end

  def create_stores(results)
    # creates store instances from the API call results
    results.first(3).map do |result|
      store = Store.new
      store.name = result['name']
      store.address = "#{result['address1']}, #{result['city']}"
      store.latitude = result['latitude']
      store.longitude = result['longitude']
      store.distance = result['distance']
      store.save
      store
    end
  end

end

  # deprecated code:

  # methods:

  # def create_inventories(wine)
  #   file = "#{Rails.public_path}/data_json/#{wine.saq_id}.json"
  #   avails = JSON.parse(File.open(file).read)['list']
  #   avails.first(3).each do |avail|
  #     i = Inventory.new(
  #       bottle_count: avail["qty"],
  #       longitude: avail["longitude"],
  #       latitude: avail["latitude"],
  #       name_saq: avail["name"],
  #       address: avail["address1"],
  #       distance: avail["distance"]
  #     )
  #     i.wine = wine
  #     i.save
  #     return i
  #   end
  # end


  # index controller:

  # # passing the top five inventories to the index page
  # @top_five = top_five_wines.map do |wine|
  #  create_inventories(wine)
  # end


  # map method:

    # Multiple markers:
    # @wine = @inventory.wine
    # @markers = @wine.inventories.map do |wine|
    #   {
    #     lat: wine.latitude,
    #     lng: wine.longitude
    #   }
    # end
