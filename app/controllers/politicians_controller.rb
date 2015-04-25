class PoliticiansController < ApplicationController

	def index
		@politicians = Politician.all.sort_by { |politician| -politician.score }
		@parties = Party.all
		@date = Time.now()
	end

	def show
		@politician = Politician.find(params[:id])
		@first_name = params[:first_name]
		@last_name = params[:last_name]
		@state = params[:state]
		@parties = Party.all
		@politicians = Politician.all

		politician_donors = Donor.find(@politician.cid)
		industry_names = []
		donations = []
		counter = 0

		5.times do |counter|
			industry_names << politician_donors.industries[counter]["@attributes"]["industry_name"]
			donations << politician_donors.industries[counter]["@attributes"]["total"]
		end 

		@one_column = LazyHighCharts::HighChart.new('graph') do |f|
		  f.title(:text => "Top Donors by Industry")
		  f.xAxis(:categories => industry_names)
		  f.series(:name => "Donations Received", :yAxis => 0, :data => donations.map(&:to_i), :color => '#B00200')

		  f.chart({:defaultSeriesType=>"column"})
			end
		
		contributor_names = []
		individual_contributions = []
		pacs_contributions = []
		total_contributions = []
		counter = 0

		5.times do |counter|
		contributor_names << politician_donors.contributors[counter]["@attributes"]["org_name"]
		individual_contributions << politician_donors.contributors[counter]["@attributes"]["indivs"]
		pacs_contributions << politician_donors.contributors[counter]["@attributes"]["pacs"]
		total_contributions << politician_donors.contributors[counter]["@attributes"]["total"]
		end

		@three_column = LazyHighCharts::HighChart.new('graph') do |f|
      f.title({ :text=>"Top Contributors by Organization"})
      f.options[:xAxis][:categories] = contributor_names      
      f.series(:type=> 'column',:name=> 'Individuals',:data=> individual_contributions.map(&:to_i), :color => '#3A5C82')
      f.series(:type=> 'column',:name=> 'PACs',:data=> pacs_contributions.map(&:to_i), :color => '#33981C')
      f.series(:type=> 'column', :name=> 'Total',:data=> total_contributions.map(&:to_i), :color => '#DD7D06')
    end

    total = []
		spent = []
		cash_on_hand = []

		total << politician_donors.total["total"]
		spent << politician_donors.total["spent"]
		cash_on_hand << politician_donors.total["cash_on_hand"]

		@three_bar = LazyHighCharts::HighChart.new('graph') do |f|
		  f.title({:text => "Senator's Financial Summary"})
		  f.options[:xAxis][:categories] = ["Receipts for 2014"]
		  f.series(:type=> 'column', :name => "Total", :yAxis => 0, :data => total.map(&:to_i), :color => '#B00200')
		  f.series(:type=> 'column', :name => "Spent", :yAxis => 0, :data => spent.map(&:to_i), :color => '#48A3F5')
		  f.series(:type=> 'column', :name => "Cash on Hand", :yAxis => 0, :data => cash_on_hand.map(&:to_i), :color => '#545656')
		end
	end
end
