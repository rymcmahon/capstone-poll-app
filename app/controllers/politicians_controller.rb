class PoliticiansController < ApplicationController

	def index
		@politicians = Politician.all
		@parties = Party.all
		#each loop around table
	end

	def show
		@politician = Politician.find(params[:id])
		@first_name = params[:first_name]
		@last_name = params[:last_name]
		@state = params[:state]
	end

end
