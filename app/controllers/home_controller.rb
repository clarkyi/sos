#encoding: utf-8
class HomeController < ApplicationController
	include Concerns::HomeConcerns
	include Concerns::ProductConcerns

	def index
	   main_products
	   product_list
	end
end