class Admins::SiteBannersController < Admins::BaseController
  before_action :set_site_banner, only: [:destroy]

  include Concerns::Admins::ImageUpload
  respond_to :html

  def index
    @site_banners = SiteBanner.all
    respond_with(@site_banners)
  end


  def new
    @site_banner = SiteBanner.new
    respond_with(@site_banner)
  end

  def create
    ary = site_banner_params
    rest = []
    ary.each do |file|
      url = upload_cover_img(file,upload_path)
      @site_banner = SiteBanner.new(base_url: url)
      unless @site_banner.save
        rest << file
      end
    end
    notice = if rest.count > 0
              "#{rest.collect{|file| file.original_filename}.join('/')}上传失败"
            else
              "#{ary.count}上传成功"
            end
    redirect_to "/admins/site_banners/", notice: notice
  end

  def destroy
    @site_banner.destroy
    redirect_to "/admins/site_banners",notice: "删除成功！"
  end

  private
    def set_site_banner
      @site_banner = SiteBanner.find(params[:id])
    end

    def site_banner_params
      params[:site_banner].require(:base_url)
    end

    def upload_path
      path = "#{Setting.file_path}banners/"
      FileUtils.mkdir_p(path) unless Dir.exist?(path)
      path
    end
end
