class PoliticiansController < ApplicationController

	def index
		@politicians = Politician.all
		@parties = Party.all
	end

	def show
		@politician = Politician.find(params[:id])
		@first_name = params[:first_name]
		@last_name = params[:last_name]
		@state = params[:state]
		@parties = Party.all
		@politicians = Politician.all

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
