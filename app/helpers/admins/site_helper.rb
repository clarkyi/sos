#encoding: utf-8
module Admins::SiteHelper
	def form_method action
		action  == "create" ? "post" : "put"
	end
end
