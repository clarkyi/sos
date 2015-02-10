#encoding:utf-8
class SiteBanner
  include Mongoid::Document
  include Mongoid::Timestamps
  scope :default,->{order("created_at desc")}
  field :base_url, type: String
end
