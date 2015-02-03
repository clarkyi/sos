#encoding: utf-8
class Admins::ProductsController < Admins::BaseController
  before_action :set_admins_product, only: [:show_state,:edit, :update, :destroy]

  include Concerns::Admins::FindByParams
  include Concerns::Admins::ImageUpload

  respond_to :html

  def index
    query = build_query(params.clone)
    @products = Product.where(query).order("created_at desc").page(params[:page])
    respond_with(@products)
  end

  def new
    @product = Product.new
    respond_with(@product)
  end

  def edit
  end

  def create
    hash = admins_product_params
    hash[:cover_url] = upload_cover_img(params[:product][:cover_url],upload_path)
    @product = Product.new(hash)
    if @product.save
      redirect_to admins_products_path, notice: '新增成功！'
    else
      respond_with(@product)
    end
  end

  def update
    hash = admins_product_params(params[:product][:cover_url])
    hash[:cover_url] = upload_cover_img(params[:product][:cover_url],upload_path)
    @product.update(hash)
    redirect_to "/admins/products/",:notice=>"编辑成功！"
  end

  def show_state
    @product.update_attributes(del_empty)
    render json: {code: 200,text: "更新成功！"}
  end

  def destroy
    @product.destroy
    redirect_to "/admins/products",notice: "删除成功！"
  end

  private
    def set_admins_product
      @product = Product.find(params[:id])
    end

    def admins_product_params
      params.require(:product).permit(:name,:is_show,:cover_url,:description,:is_single,:is_recommend,:is_show_left)
    end

    def del_empty
      hash = params.permit(:is_single,:is_recommend,:is_show_left,:status)
      hash.map do |k,v|
        hash.delete(k) if hash[k].blank?
      end
      hash
    end

    def upload_path
      date = Time.now.strftime("%y/%m/%d")
      path = "#{Setting.file_path}#{date}/"
      FileUtils.mkdir_p(path) unless Dir.exist?(path)
      path
    end
    
end
