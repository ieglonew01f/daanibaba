class IndexController < ApplicationController
  def index

    #save each request ip for little tracking
    visitor = Visitor.new
    visitor.ip = request.remote_ip
    visitor.save

    @coupons_release_date = Setting.find_by_name('coupons_release_date').value
  end
end
