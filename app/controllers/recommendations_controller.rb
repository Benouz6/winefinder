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

    @recommendations = create_recommendations(params, stores, wines)

    raise

  end

  def map
    @inventory = Inventory.find(params[:id])
    @markers = [{ lat: @inventory.latitude, lng: @inventory.longitude }]
  end

  private

  def get_closest_stores(params)
    # get coordinates from user address
    coords = Geocoder.search(params[:address]).first.coordinates
    coordinates = { latitude: coords[0],
                    longitude: coords[1] }

    # get closest stores with SAQ API call
    find_stores_url = "https://www.saq.com/en/store/locator/ajaxlist/?loaded=0&latitude=#{coordinates[:latitude]}&longitude=#{coordinates[:longitude]}&_=1638314430766" # thank god this is a thing, thanks SAQ devs!
    json = URI.open(find_stores_url, { 'x-requested-with' => 'XMLHttpRequest' }).read
    results = JSON.parse(json)['list']

    # return list of store instances
    create_stores(results)
  end

  def create_stores(results)
    # creates store instances from the first 3 API call results and returns them in an array
    results.first(3).map do |result|
      Store.create(
        name: result['name'],
        address: "#{result['address1']}, #{result['city']}",
        latitude: result['latitude'],
        longitude: result['longitude'],
        distance: result['distance'],
        saq_identifier: result['identifier']
      )
    end
  end

  def get_best_wines(params)
    # top_wines = Wine
    #             .includes(:foods)
    #             .joins(food_pairings: :food)
    #             .where(foods: { id: params[:food_id] })
    #             .where(color: params[:color].downcase)
    #             .where(price_cents: ..params[:price].to_i * 100)
    #             .order(price_cents: :desc)
    #             .order(rating: :desc)
    #             .limit(20)

    top_wines = Wine.first(10) # used for testing
    return top_wines
  end

  def create_recommendations(params, stores, wines)
    recommendations = []

    # cycles over each store in order to check bottle availabilities.
    stores.each do |store|
      left_over_wines = []

      # goes over each wine bottle to check availability (bottle count)
      wines.each do |wine|
        url = "https://www.saq.com/en/storeinventory/productstores/ajaxlist/id/#{wine.saq_code}/store/#{store.saq_identifier}?_=1638306135901"
        json = URI.open(url, { 'x-requested-with' => 'XMLHttpRequest' }).read

        # validates that the store has some stock
        if json != '[]'
          bottle_count = JSON.parse(json).first['quantite'].to_i
          # validates if there is adequate quantity
          if params[:quantity].to_i <= bottle_count
            # creates inventory instances and stores them in recommendations
            recommendation = Inventory.new(
              wine: wine,
              store: store,
              bottle_count: bottle_count
            )
            recommendation.save
            recommendations << recommendation
          else
            left_over_wines << wine
          end
        else
          left_over_wines << wine
        end
      end
      # ensure next store that gets checked only gets the bottles with no stock in the previous store
      wines = left_over_wines
    end
    return recommendations
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
