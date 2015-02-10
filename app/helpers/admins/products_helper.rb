module Admins::ProductsHelper
	def build_admin_product path,method
		"#{path}/#{method == :put ? @product.id : "" }"
	end
end
