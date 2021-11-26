require_relative "scrapers/scrape_wines"

Availability.destroy_all
FoodPairing.destroy_all
Wine.destroy_all
Food.destroy_all

Food.create!(name: "Chicken")
Food.create!(name: "Fish")
Food.create!(name: "Meat")

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
