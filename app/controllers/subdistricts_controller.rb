class SubdistrictsController < ApplicationController
	respond_to :json

	def index
		@subdistricts = Subdistrict.all
		respond_with @subdistricts
	end
end