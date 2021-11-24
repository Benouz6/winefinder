require "nokogiri"
require "open-uri"

Wine.destroy_all
Food.destroy_all

page = 1
colors = ["red", "white"]

1.times do
  url = "https://www.saq.com/en/products/wine/#{colors.first}-wine?p=#{page}"
  html_file = URI.open(url).read
  html_doc = Nokogiri::HTML(html_file)

  html_doc.search(".product-item-info").first(1).each do |element|
    # pp element
    name = element.search(".product-item-name").text.strip
    price = element.search(".price")[0].text.strip.gsub(/[[:space:]]\$/, "").gsub(",", "").to_i
    saq_id = element.search("[data-product-id]").attribute("data-product-id").value
    temp_origin = element.search(".product-item-identity-format span").text.strip.gsub(/[|]/, "").split(/\b/)
    origin = temp_origin.reject(&:blank?).last

    p element.search(".product-item-link").attribute('href').value

    # price = price-final_price
  end
  #  page += 50
end

# Wine.create!(
#   name: name,
#   price: price,
#   origin: origin,
#   color: color,
#   saq_id: saq_id
# )


# Wine.create(
#   name: "Alois Lageder",
#   color: "White",
#   region: "Trentin Haut-Adige",
#   description: "Excellent pinot blanc, a perfect wine to take in summer and as an aperitif.",
#   price: 19
# )

# Wine.create(
#   name: "Bourgogne Aligoté",
#   color: "White",
#   region: "Bourgogne",
#   description: "Excellent everywhere, as an aperitif, to accompany a starter or the main course.",
#   price: 17
# )

# Wine.create(
#   name: "Saumur",
#   color: "White",
#   region: "Vallée de la Loire, L'Anjou and le Saumurois",
#   description: "Gorgeous aromas and dry. Good with oysters",
#   price: 18
# )

# Wine.create(
#   name: "Ambo Grigio Friuli",
#   color: "White",
#   region: "Friuli-Venezia Giulia",
#   description: "Perfect for having a nice chilled glass on a hot summer day",
#   price: 12
# )

# Wine.create(
#   name: "Alsace Pinot Blanc",
#   color: "White",
#   region: "Alsace",
#   description: "It’s light and fresh tasting and great with fish",
#   price: 11
# )

# Wine.create(
#   name: "Tommasi Valpolicella",
#   color: "Red",
#   region: "Veneto",
#   description: "It goes very well with pasta and shrimp without a heavy sauce",
#   price: 21
# )
# Wine.create(
#   name: "Apothic Red",
#   color: "Red",
#   region: "Californie",
#   description: "Excellent wine with pork pasta as well as stews and red meats",
#   price: 27
# )

# Wine.create(
#   name: "Duas Quintas",
#   color: "Red",
#   region: "Porto/Douro",
#   description: "Would go very well with meats on the grill.",
#   price: 10
# )

# Wine.create(
#   name: "Langhe Nebbiolo",
#   color: "Red",
#   region: "Piedmont",
#   description: "A sublime pairing to game terrine or a veal chop.",
#   price: 18
# )

# Wine.create(
#   name: "Zig Zag",
#   color: "Red",
#   region: "Vallée de la Loire, L'Auvergne",
#   description: "Enjoy with a chicken breast stuffed with sundried tomatoes, or even with burritos.",
#   price: 22
# )

Food.create(
  name: "Chicken"
)

Food.create(
  name: "Fish"
)

Food.create(
  name: "Meat"
)
