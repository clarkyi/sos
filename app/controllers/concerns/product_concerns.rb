#encoding: utf-8
module Concerns::ProductConcerns
  def main_products
    @main_products = Product.main_products
  end

  def product_list
    @list_products = Product.list_products
  end

  def product_left_list

  end  
end