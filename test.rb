require "nokogiri"
require "open-uri"
url = "https://www.saq.com/en/products/wine/red-wine?p=1"
html_file = URI.open(url).read
html_doc = Nokogiri::HTML(html_file)
element = html_doc.search(".product-item-info").first
saq_code = element.search(".saq-code").to_s.gsub(/\D/, '').to_i

puts saq_code
