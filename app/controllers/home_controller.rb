#encoding: utf-8
class HomeController < ApplicationController
	include Concerns::HomeConcerns
	include Concerns::ProductConcerns

	def index
	   main_products
     about_us
	   product_list
	end
end