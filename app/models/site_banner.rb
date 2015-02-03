#encoding:utf-8
class SiteBanner
  include Mongoid::Document
  include Mongoid::Timestamps
  field :base_url, type: String
end
