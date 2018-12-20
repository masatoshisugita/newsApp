class TopicsController < ApplicationController
  def index
  agent = Mechanize.new
  page = agent.get("https://www.lifehacker.jp/articles/")
  #@l = page.search('//a[contains(@href ,"2018/12")]')
  #@l = page.search('//a[contains(@class, "lh-summary-title")]')
  @l = page.search('h3 a')

  agent2 = Mechanize.new
  page2 = agent2.get("https://r25.jp/")
  #@q = page2.search('//*[@id="app"]/div/main/div/div[3]/div[1]/div[2]/div/div[1]/a/div[2]/h2')
  @q = page2.search('//a[contains(@name ,"latest")]')

  agent3 = Mechanize.new
  page3 = agent3.get("https://jp.techcrunch.com/")
  @p = page3.search('//h2[contains(@class, "post-title")]')

  agent4 = Mechanize.new
  page4 = agent4.get("https://diamond.jp/category/dol")
  @d = page4.search('//article/a')
  
  end
end
