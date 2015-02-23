#encoding: utf-8
class ServiceController < ParentController
  def index
    @obj = Service.first
  end
end