class PoliticiansController < ApplicationController

	def index
		@politicians = Politician.all
		@parties = Party.all
		#each loop around table
	end

end
