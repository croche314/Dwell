class HomeController < ApplicationController
	layout 'home'

	def landlords
		render 'landlords'
	end

	def renters
		render 'renters'
	end

	def how_dwell_works
		render 'how_dwell_works'
	end
end
