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

		@politician_donors = Donor.find(@politician.cid)
		industry_names = []
		donations = []
		counter = 0

		5.times do |counter|
			industry_names << @politician_donors.industries[counter]["@attributes"]["industry_name"]
			donations << @politician_donors.industries[counter]["@attributes"]["total"]
		end 

		@chart = LazyHighCharts::HighChart.new('graph') do |f|
		  f.title(:text => "Top Donors by Industry")
		  f.xAxis(:categories => industry_names)
		  f.series(:name => "Donations Received", :yAxis => 0, :data => donations.map(&:to_i), :color => '#B00200')

		  # f.yAxis [
		  #   {:title => {:text => "Donations Received", :margin => 70} },
		  
		  # ]

		  f.chart({:defaultSeriesType=>"column"})
			end
		
		contributor_names = []
		individual_contributions = []
		pacs_contributions = []
		total_contributions = []
		counter = 0

		5.times do |counter|
		contributor_names << @politician_donors.contributors[counter]["@attributes"]["org_name"]
		individual_contributions << @politician_donors.contributors[counter]["@attributes"]["indivs"]
		pacs_contributions << @politician_donors.contributors[counter]["@attributes"]["pacs"]
		total_contributions << @politician_donors.contributors[counter]["@attributes"]["total"]
		end

		@three_bar = LazyHighCharts::HighChart.new('graph') do |f|
      f.title({ :text=>"Top Contributors by Organization"})
      f.options[:xAxis][:categories] = contributor_names
      # f.labels(:items=>[:html=>"Total fruit consumption", :style=>{:left=>"40px", :top=>"8px", :color=>"black"} ])      
      f.series(:type=> 'column',:name=> 'Individuals',:data=> individual_contributions.map(&:to_i), :color => '#3A5C82')
      f.series(:type=> 'column',:name=> 'PACs',:data=> pacs_contributions.map(&:to_i), :color => '#33981C')
      f.series(:type=> 'column', :name=> 'Total',:data=> total_contributions.map(&:to_i), :color => '#DD7D06')
      # f.series(:type=> 'spline',:name=> 'Average', :data=> [3, 2.67, 3, 6.33, 3.33])
      # f.series(:type=> 'pie',:name=> 'Total consumption', 
      #   :data=> [
      #     {:name=> 'Jane', :y=> 13, :color=> 'red'}, 
      #     {:name=> 'John', :y=> 23,:color=> 'green'},
      #     {:name=> 'Joe', :y=> 19,:color=> 'blue'}
      #   ],
      #   :center=> [100, 80], :size=> 100, :showInLegend=> false)
    end
		end

end
