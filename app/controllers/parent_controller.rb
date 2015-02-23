#encoding: utf-8
class ParentController < ApplicationController
  before_filter :get_left_product_menu,:contact_us
  
  private
    def get_left_product_menu
      @products_menu = Product.left_products
    end
    def contact_us
      @contact = Contact.last
    end
end