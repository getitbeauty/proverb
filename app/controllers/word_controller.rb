class WordController < ApplicationController
  def index
    
  end
  
  def daily_proverbs
    @yourname = params[:yourname]
    arr_fortune = ['멋질', '잘 풀릴', '행복할', '나쁘지 않을', '기분 좋은 일만 가득할', '뜻밖의 행운이 찾아올', '새로운 사람을 만나게 될', '운명적인 만남이 기다릴', '대박일', '끝내줄']
    
    @fortune = arr_fortune.sample(1)
    
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
