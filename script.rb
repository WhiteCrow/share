#Please Download gem "nokogiri" before run the script

require 'nokogiri'
require 'open-uri'

doc =  Nokogiri::HTML(open('http://www.codeschool.com/code_tv'))

tv_links = doc.css('.screencast h4 a').map do |a|
  "http://www.codeschool.com/" + a.attribute("href").value
end

puts tv_links

docs = tv_links.map do |link|
  Nokogiri::HTML(open link)
end

puts "docs get all nokogiri documents"
