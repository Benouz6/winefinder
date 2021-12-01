def scrape_wines
  page = 1
  colors = ["red-wine", "white-wine", "rose"] * 4
  wine_count = 1

  colors.each do |color|
    url = "https://www.saq.com/en/products/wine/#{color}?p=#{page}"
    html_file = URI.open(url).read
    html_doc = Nokogiri::HTML(html_file)

    html_doc.search(".product-item-info").each do |element|
      print "#{wine_count}."
      name = element.search(".product-item-name").text.strip.gsub(/\s+/, " ")
      print "#{name} - "
      price_float = element.search(".price")[0].text.strip.gsub(/[[:space:]]\$/, "").gsub(",", "").gsub("$", "").to_f
      price = (price_float * 100).to_i
      rating_result = element.search(".rating-result").attribute("title")
      rating = rating_result.nil? ? 0 : rating_result.value.match(/\d+/)[0].to_i
      image_url = element.search(".product-image-photo").attribute('src').value
      link = element.search(".product-item-link").attribute('href').value
      saq_code = element.search(".saq-code").to_s.gsub(/\D/, '').to_i

      # get info nested into product page
      html_file_wine = URI.open(link).read
      html_doc_wine = Nokogiri::HTML(html_file_wine)

      region = html_doc_wine.search("[data-th]")[1].text.strip
      country = html_doc_wine.search("[data-th]")[0].text.strip
      grape = html_doc_wine.search('strong[data-th="Grape variety"]').text.strip
      alcohol = html_doc_wine.search('strong[data-th="Degree of alcohol"]').text.strip
      origin = "#{country}, #{region}"

      Wine.create!(
        name: name,
        price_cents: price,
        origin: origin,
        color: color,
        image_url: image_url,
        rating: rating,
        grapes: grape,
        alcohol: alcohol,
        saq_code: saq_code
      )
      puts 'done!'
      wine_count += 1
    end

    puts "page #{page} done!"
    page += 1
  end
end
