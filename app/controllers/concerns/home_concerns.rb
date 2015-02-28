#encoding: utf-8
module Concerns::HomeConcerns
 	def about_us
 		@about = AboutUs.last
 	end
end