require "nokogiri"
require "open-uri"
require_relative "scrapers/scrape_wines"

puts "deleting inventories"
Inventory.destroy_all
puts "deleting food pairings"
FoodPairing.destroy_all
puts "deleting wines"
Wine.destroy_all
puts "deleting foods"
Food.destroy_all


puts "creating Beef"
Food.create!(name: "Beef")
puts "creating Pork"
Food.create!(name: "Pork")
puts "creating Poultry"
Food.create!(name: "Poultry")
puts "creating Cheese"
Food.create!(name: "Cheese")
puts "creating Fish"
Food.create!(name: "Fish")
puts "creating Vegetarian"
Food.create!(name: "Vegetarian")
puts "creating Mushrooms"
Food.create!(name: "Mushrooms")
puts "creating Spicy food"
Food.create!(name: "Spicy food")

puts "Scraping wines..."
scrape_wines()

wines = Wine.all

wines.each do |wine|
  puts "pairing wine: #{wine.name}"
  foods = Food.all
  FoodPairing.create!(
    food: foods.sample,
    wine: wine
  )
end

puts "Seed created!!! :)"
