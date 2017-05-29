class WordController < ApplicationController
  def index
    
  end
  
  def daily_proverbs
    @yourname = params[:yourname]
    
    require 'open-uri'
    doc = Nokogiri::HTML(open("https://namu.wiki/w/%EC%86%8D%EB%8B%B4/%ED%95%9C%EA%B5%AD"))
    # doc.css('div.wiki-inner-content > ul.wiki-list > li > p').text()
    
    word_array = Array.new
    doc.css('div.wiki-inner-content > ul.wiki-list > li > p').each do |x|
      word_array.push(x.text())
    end
    
    @today_word = word_array.sample(3)
    
  end
  
end
