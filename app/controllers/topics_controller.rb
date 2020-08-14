class TopicsController < ApplicationController
  def index
  agent = Mechanize.new
  page = agent.get("https://www.mixonline.jp/")
  @mikusu = page.search('//div[contains(@class, "newsSubject")]')

  agent2 = Mechanize.new
  page2 = agent2.get("https://www.ghc-j.com/case/?orderby=default_date&order=DESC")
  @q = page2.search('//h1[contains(@class ,"page-h1")]')

  agent3 = Mechanize.new
  page3 = agent3.get("https://www.joint-kaigo.com/")
  @p = page3.search('//h2[contains(@class, "post-title")]')

  agent4 = Mechanize.new
  page4 = agent4.get("https://diamond.jp/category/dol")
  @d = page4.search('//article/a')

  agent5 = Mechanize.new
  page5 = agent5.get("http://www.dhbr.net/")
  @h = page5.search('//a[contains(@class, "cf")]')

  agent6 = Mechanize.new
  page6 = agent6.get("https://sports.yahoo.co.jp/")
  @s = page6.search('//a[contains(@class, "sn-list__itemArticleLink")]')

  @topic = Topic.new

  end

  def create
    @topic = current_user.topics.new(topic_params)
    if @topic
      @topic.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    @topic = Topic.find_by(id: params[:id])
    if @topic.destroy
      redirect_to "/users/index"
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:user_id, :text,:url)
  end

end
