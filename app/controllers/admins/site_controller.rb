class Admins::SiteController < Admins::BaseController

  before_filter :find_address, only: :address_update
  before_filter :find_about_us, only: :about_us_update
  before_filter :find_service, only: :service_update
  before_filter :find_contract, only: :contact_update

  skip_before_filter :authenticate_user, only: [:upload]
  skip_before_filter :verify_authenticity_token, :only => [:upload]  

  include Concerns::Admins::ImageUpload

  def address_new
    @obj = Address.first
    if @obj.present?
      render :address_edit
    else
      @obj = Address.new
    end 
  end

  def address_create
    @obj = Address.new(set_params)
    if @obj.save
      redirect_to "/admins/site/address_new", notice:"添加成功！"
    else
      render :address_new
    end
  end

  def address_update
    @obj.update_attributes(set_params)
    redirect_to "/admins/site/address_new",notice: "修改成功"
  end

  def address_edit
  end

  def service_new
    @obj = Service.first
    if @obj.present?
      render :service_edit
    else
      @obj = Service.new
    end 
  end

  def service_create
    @obj = Service.new(set_params)
    if @obj.save
      redirect_to "/admins/site/service_new", notice:"添加成功！"
    else
      respond_with(@obj)
    end
  end

  def service_update
    @obj.update_attributes(set_params)
    redirect_to "/admins/site/service_new",notice: "修改成功"
  end

  def service_edit
  end

  def about_us_new
    @obj = AboutUs.first
    if @obj.present?
      render :about_us_edit
    else
      @obj = AboutUs.new
    end 
  end

  def about_us_create
    @obj = AboutUs.new(set_params)
    if @obj.save
      redirect_to "/admins/site/about_us_new", notice:"添加成功！"
    else
      respond_with(@obj)
    end
  end

  def about_us_update
    @obj.update_attributes(set_params)
    redirect_to "/admins/site/about_us_new",notice: "修改成功"
  end

  def about_us_edit
  end

  def contact_create
    @obj = Contact.new(set_params)
    if @obj.save
      redirect_to "/admins/site/contact_new", notice:"添加成功！"
    else
      render :contact_new
    end
  end

  def contact_update
    @obj.update_attributes(set_params)
    redirect_to "/admins/site/contact_new",notice: "修改成功"
  end

  def contact_edit
  end

  def contact_new
    @obj = Contact.first
    if @obj.present?
      render :contact_edit
    else
      @obj = Contact.new
    end 
  end

  def upload
    url = upload_cover_img(params[:img],upload_path)
    render json: {url: url,state: 'success'} 
  end

  private
    def set_params
      if params[:action].include?('address')
        params.require(:address).permit(:content)
      else
        params.permit(:content)
      end
    end

    def find_address
      @obj = Address.find(params[:id])
    end

    def find_service
      @obj = Service.find(params[:id])
    end
    def find_about_us
      @obj = AboutUs.find(params[:id])
    end

    def find_contract
      @obj = Contract.find(params[:id])
    end

    def upload_path
      path = "#{Setting.file_path}site/"
      FileUtils.mkdir_p(path) unless Dir.exist?(path)
      path
    end

end
