class TopicsController < ApplicationController
  def index
  agent = Mechanize.new
  page = agent.get("https://www.mixonline.jp/")
  @mikusu = page.search('//div[contains(@class, "newsSubject")]')

  agent2 = Mechanize.new
  page2 = agent2.get("https://www.ghc-j.com/case/?orderby=default_date&order=DESC")
  @global = page2.search('//h1[contains(@class ,"page-h1")]')

  agent3 = Mechanize.new
  page3 = agent3.get("https://medical-tribune.co.jp/")
  @tribune = page3.search('//p[contains(@class, "article-title")]')

  agent4 = Mechanize.new
  page4 = agent4.get("https://www.carenet.com/")
  @carenet = page4.search('//div[contains(@class, "post-ranking__text-item")]')

  agent5 = Mechanize.new
  page5 = agent5.get("https://gemmed.ghc-j.com/")
  @gemmed = page5.search('//h3[contains(@class, "ttl")]')

  agent6 = Mechanize.new
  page6 = agent6.get("https://xtech.nikkei.com/media/digitalhealth/")
  @digital = page6.search('//h3[contains(@class, "p-articlePanel_item_title")]')

  @topic = Topic.new

  end

  def create
    @topic = current_user.topics.new(topic_params)
    if @topic.save
      flash[:success] = "記事を保存しました"
      redirect_to root_path
    else
      flash.now[:danger] = "記事を保存できませんでした"
      render :root_url
    end
  end

  def destroy
    @topic = Topic.find_by(id: params[:id])
    if @topic.destroy
      flash[:danger] = "記事を削除しました"
      redirect_to "/users/index"
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:user_id, :text,:url)
  end

end
