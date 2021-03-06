def fetch_description(link)
  html_file = URI.open(link).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search("[data-th]")[3].text.strip
end

def fetch_region(link)
  html_file = URI.open(link).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search("[data-th]")[1].text.strip
end

def fetch_country(link)
  html_file = URI.open(link).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search("[data-th]")[0].text.strip
end

def fetch_grape_variety(link)
  html_file = URI.open(link).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('strong[data-th="Grape variety"]').text.strip
end

def fetch_alcohol_rating(link)
  html_file = URI.open(link).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('strong[data-th="Degree of alcohol"]').text.strip
end

def fetch_inventories(id)
  url = "https://www.saq.com/en/store/locator/ajaxlist/context/product/id/#{id}?loaded=0&_=1637944648926"
  json = URI.open(url, { 'x-requested-with' => 'XMLHttpRequest' }).read
  File.open("public/data_json/#{id}.json", 'w') do |f|
    f.write(json)
  end
end

def scrape_wines
  page = 1
  colors = ["red-wine", "white-wine", "rose"] * 4

  colors.each do |color|
    url = "https://www.saq.com/en/products/wine/#{color}?p=#{page}"
    html_file = URI.open(url).read
    html_doc = Nokogiri::HTML(html_file)

    html_doc.search(".product-item-info").each do |element|
      name = element.search(".product-item-name").text.strip.gsub(/\s+/, " ")
      price_float = element.search(".price")[0].text.strip.gsub(/[[:space:]]\$/, "").gsub(",", "").gsub("$", "").to_f
      price = (price_float*100).to_i
      saq_id = element.search("[data-product-id]").attribute("data-product-id").value
      temp_origin = element.search(".product-item-identity-format span").text.strip.gsub(/[|]/, "").split(/\b/)
      # origin = temp_origin.reject(&:blank?).last
      rating_result = element.search(".rating-result").attribute("title")
      rating = rating_result.nil? ? 0 : rating_result.value.match(/\d+/)[0].to_i
      image_url = element.search(".product-image-photo").attribute('src').value
      link = element.search(".product-item-link").attribute('href').value
      saq_code = element.search(".saq-code").to_s.gsub(/\D/, '').to_i

      description = fetch_description(link)
      region = fetch_region(link)
      country = fetch_country(link)
      grape = fetch_grape_variety(link)
      alcohol = fetch_alcohol_rating(link)
      origin = "#{region}, #{country}"

      Wine.create!(
        name: name,
        price_cents: price,
        saq_id: saq_id,
        origin: origin,
        color: color,
        description: description,
        image_url: image_url,
        rating: rating,
        grapes: grape,
        alcohol: alcohol,
        saq_code: saq_code
      )
      # fetch_inventories(saq_id)   # deprecated feature, keep it commented out
    end
    page += 50
    puts "#{page} done"
  end
end
