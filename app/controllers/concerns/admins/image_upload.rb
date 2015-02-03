#encoding: utf-8
module Concerns::Admins::ImageUpload
	def upload_cover_img file,path
    if file.present? && file.original_filename.present? && file.size < 5 * 1024 * 1024 && file.size > 0
      filename=get_file_name(file.original_filename)
      url = "#{path}#{filename}"
      File.open(url, "wb"){|f| f.write(file.read)}
      url.gsub!("/opt/uploads","") #软链接到项目的public目录下，所以需要清理多余部分文件路径
    end
    url
  end

  def get_file_name(filename)
    unless filename.blank?
       Time.now.to_i.to_s+Random.rand(10000).to_s+File.extname(filename)
    end
  end
end