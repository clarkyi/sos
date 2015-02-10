#encoding: utf-8
class ProductsController < ParentController
  def index
    @products = Product.list.page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
  end
end