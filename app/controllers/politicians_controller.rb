class PoliticiansController < ApplicationController

	def index
		@politicians = Politician.all

		#each loop around table
	end

end
