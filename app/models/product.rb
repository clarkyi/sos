class Product
  include Mongoid::Document
  include Mongoid::Timestamps
  paginates_per 20

  scope :list, -> {where(status:1,is_show: 1).order("updated_at desc")}
  scope :main_products, -> {where(status:1,is_show: 1,is_single: 1).order("updated_at desc")}
  scope :list_products, -> {where(status:1,is_show: 1,is_recommend: 1).order("updated_at desc")}
  scope :left_products, -> {where(status:1,is_show: 1,is_show_left: 1).order("updated_at desc")}
  
  field :cover_url, type: String
  field :description, type: String
  field :name, 	type: String
  field :is_show, type: Integer
  field :status, type: Integer,default: 1
  field :is_single, type: Integer, default: 0 #是否首页单个显示
  field :is_recommend,  type: Integer, default:0 #是否推荐到首页
  field :is_show_left, type: Integer, default:0 #是否显示在右侧栏

  validates :name, presence: true
  validates :is_show, presence: true
  validates :cover_url, presence: true
end
