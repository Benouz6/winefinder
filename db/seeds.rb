require "nokogiri"
require "open-uri"

Wine.destroy_all
Food.destroy_all

def fetch_description(link)
  html_file = URI.open(link).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search("[data-th]")[3].text.strip
end

Food.create!(name: "Chicken")
Food.create!(name: "Fish")
Food.create!(name: "Meat")

page = 1
colors = ["red", "white"] * 4

colors.each do |color|
  url = "https://www.saq.com/en/products/wine/#{color}-wine?p=#{page}"
  html_file = URI.open(url).read
  html_doc = Nokogiri::HTML(html_file)

  html_doc.search(".product-item-info").each do |element|
    name = element.search(".product-item-name").text.strip.gsub(/\s+/, " ")
    price_float = element.search(".price")[0].text.strip.gsub(/[[:space:]]\$/, "").gsub(",", "").gsub("$", "").to_f
    price = (price_float*100).to_i
    saq_id = element.search("[data-product-id]").attribute("data-product-id").value
    temp_origin = element.search(".product-item-identity-format span").text.strip.gsub(/[|]/, "").split(/\b/)
    origin = temp_origin.reject(&:blank?).last

    link = element.search(".product-item-link").attribute('href').value
    description = fetch_description(link)

    Wine.create!(
      name: name,
      price: price,
      saq_id: saq_id,
      region: origin,
      color: color,
      description: description
    )
  end
  page += 50
end

wines = Wine.all

wines.each do |wine|
  foods = Food.all
  FoodPairing.create!(
    food: foods.sample,
    wine: wine
  )
end
puts "Seed created"
