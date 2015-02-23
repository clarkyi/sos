class Admins::SiteController < Admins::BaseController

  before_filter :find_obj, only: [:address_update,:about_us_update,:service_update,:contact_update]
  
  skip_before_filter :authenticate_user, only: [:upload]
  skip_before_filter :verify_authenticity_token, :only => [:upload]  

  include Concerns::Admins::ImageUpload

  def address_new
    exec_klass
  end

  def address_create
    exec_klass
  end

  def address_update
    exec_klass
  end

  def address_edit
  end

  def service_new
    exec_klass
  end

  def service_create
    exec_klass
  end

  def service_update
    exec_klass
  end

  def service_edit
  end

  def about_us_new
    exec_klass
  end

  def about_us_create
    exec_klass
  end

  def about_us_update
    exec_klass
  end

  def about_us_edit
  end

  def contact_create
    exec_klass
  end

  def contact_update
    exec_klass
  end

  def contact_edit
  end

  def contact_new
    exec_klass
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

    def find_obj
      @obj = get_klass.find(params[:id])
    end

    def upload_path
      path = "#{Setting.file_path}site/"
      FileUtils.mkdir_p(path) unless Dir.exist?(path)
      path
    end

    def exec_klass
      self.send("obj_#{get_action}",get_klass)
    end

    def get_klass
      method = params[:action]
      klass_name = method[0, method.rindex("_")]
      klass_name.camelize.constantize
    end

    def obj_new klass
      @obj = klass.first
      if @obj.present?
        render "#{klass.name.underscore}_edit".to_sym
      else
        @obj = klass.new
      end 
    end

    def get_action
      str = params[:action].clone
      str[str.rindex("_") + 1, str.length]
    end

    def obj_update klass=nil
      @obj.update_attributes(set_params)
      redirect_to "/admins/site/#{@obj.class.name.underscore}_new",notice: "修改成功"
    end

    def obj_create klass
      @obj = klass.new(set_params)
      if @obj.save
        redirect_to "/admins/site/#{klass.underscore}_new", notice:"添加成功！"
      else
        render "#{klass.name.underscore}_new".to_sym
      end
    end

end
