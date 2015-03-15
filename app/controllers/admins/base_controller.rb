#encoding: utf-8
class Admins::BaseController < ApplicationController

	layout "admin"
	before_action :authenticate_admin!,:set_active

	def set_active
    controller = params["controller"].gsub("/","_")
    self.instance_variable_set("@#{controller}", 'active')
  end
end