
require "open-uri"

Wine.destroy_all
Food.destroy_all

Wine.create(
  name: "Alois Lageder",
  color: "White",
  region: "Trentin Haut-Adige",
  description: "Excellent pinot blanc, a perfect wine to take in summer and as an aperitif.",
  price: 19
)

Wine.create(
  name: "Bourgogne Aligoté",
  color: "White",
  region: "Bourgogne",
  description: "Excellent everywhere, as an aperitif, to accompany a starter or the main course.",
  price: 17
)

Wine.create(
  name: "Saumur",
  color: "White",
  region: "Vallée de la Loire, L'Anjou and le Saumurois",
  description: "Gorgeous aromas and dry. Good with oysters",
  price: 18
)

Wine.create(
  name: "Ambo Grigio Friuli",
  color: "White",
  region: "Friuli-Venezia Giulia",
  description: "Perfect for having a nice chilled glass on a hot summer day",
  price: 12
)

Wine.create(
  name: "Alsace Pinot Blanc",
  color: "White",
  region: "Alsace",
  description: "It’s light and fresh tasting and great with fish",
  price: 11
)

Wine.create(
  name: "Tommasi Valpolicella",
  color: "Red",
  region: "Veneto",
  description: "It goes very well with pasta and shrimp without a heavy sauce",
  price: 21
)
Wine.create(
  name: "Apothic Red",
  color: "Red",
  region: "Californie",
  description: "Excellent wine with pork pasta as well as stews and red meats",
  price: 27
)

Wine.create(
  name: "Duas Quintas",
  color: "Red",
  region: "Porto/Douro",
  description: "Would go very well with meats on the grill.",
  price: 10
)

Wine.create(
  name: "Langhe Nebbiolo",
  color: "Red",
  region: "Piedmont",
  description: "A sublime pairing to game terrine or a veal chop.",
  price: 18
)

Wine.create(
  name: "Zig Zag",
  color: "Red",
  region: "Vallée de la Loire, L'Auvergne",
  description: "Enjoy with a chicken breast stuffed with sundried tomatoes, or even with burritos.",
  price: 22
)

Food.create(
  name: "Chicken"
)

Food.create(
  name: "Fish"
)

Food.create(
  name: "Meat"
)
