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


puts "creating Seafood"
Food.create!(name: "Seafood")
puts "creating Meat"
Food.create!(name: "Meat")
puts "creating Cheese"
Food.create!(name: "Cheese")
puts "creating Vegetables"
Food.create!(name: "Vegetables")
puts "creating Deserts"
Food.create!(name: "Deserts")

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
