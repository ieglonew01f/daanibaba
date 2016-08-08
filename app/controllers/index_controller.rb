class IndexController < ApplicationController
  def index

    #save each request ip for little tracking
    visitor = Visitor.new
    visitor.ip = request.remote_ip
    visitor.save

    @coupons_release_date = Setting.find_by_name('coupons_release_date').value
    @body_header_text = Setting.find_by_name('body_header_text').value
    @site_name = Setting.find_by_name('site_name').value
    @footer_news_text = Setting.find_by_name('footer_news_text').value
    @hint_text = Setting.find_by_name('hint_text').value
  end
end
