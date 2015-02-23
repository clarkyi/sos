#encoding: utf-8
class AboutUsController < ParentController
  def index
    @obj = AboutUs.first
  end
end