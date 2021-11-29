require "nokogiri"
require "open-uri"
require_relative "scrapers/scrape_wines"

FoodPairing.destroy_all
Wine.destroy_all
Food.destroy_all

Food.create!(name: "Beef")
Food.create!(name: "Pork")
Food.create!(name: "Poultry")
Food.create!(name: "Cheese")
Food.create!(name: "Fish")
Food.create!(name: "Vegetarian")
Food.create!(name: "Mushrooms")
Food.create!(name: "Spicy food")


scrape_wines()

wines = Wine.all

wines.each do |wine|
  foods = Food.all
  FoodPairing.create!(
    food: foods.sample,
    wine: wine
  )
end
puts "Seed created"
