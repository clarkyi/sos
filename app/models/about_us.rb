#encoding: utf-8
class AboutUs
  include Mongoid::Document
  include Mongoid::Timestamps
  field :content, type: String
  validates :content, presence: true
  
end
