class PoliticiansController < ApplicationController
		# respond_to :json, :xml

	def index
		@politicians = Politician.all.sort_by { |politician| -politician.score }
		@parties = Party.all
		@date = Time.now()
		# respond_with(@politicians)
	end

	def show
		@politician = Politician.find(params[:id])
		@first_name = params[:first_name]
		@last_name = params[:last_name]
		@state = params[:state]
		@parties = Party.all
		@politicians = Politician.all
		# respond_with(@politician)

		Unirest.get("http://www.opensecrets.org/api/?method=candIndustry&cid=N00005195&cycle=2014&apikey=#{ENV[opensecrets_api_key]}")

		@chart = LazyHighCharts::HighChart.new('graph') do |f|
		  f.title(:text => "Top Campaign Donors")
		  f.xAxis(:categories => ["NRA", "Exxon Mobile", "Teachers Union", "Comcast", "United Health"])
		  f.series(:name => "Donations Received", :yAxis => 0, :data => [14119, 5068, 4985, 3339, 2656])
		  f.series(:name => "Avg. Donation to all Candidates", :yAxis => 1, :data => [310, 127, 1340, 81, 65])

		  f.yAxis [
		    {:title => {:text => "Donations Received in Millions", :margin => 70} },
		    {:title => {:text => "Avg. Donation to all Candidates in Millions"}, :opposite => true},
		  ]

		  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
		  f.chart({:defaultSeriesType=>"column"})
		end
	end

end
