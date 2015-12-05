desc "This task is called by the Heroku scheduler to call the NYT API"
task :nyt_api_votes => :environment do
  politicians = Politician.all


	request = Unirest.get("http://api.nytimes.com/svc/politics/v3/us/legislative/congress/114/senate/members/current.json?api-key=#{Figaro.env.nyt_api_key}").body

		request["results"][0]["members"].each do |dw|
			politician = Politician.find_by(:bio_guide => dw["id"])
			if politician
				politician.update(:votes_with_party_pct => dw["votes_with_party_pct"], :missed_votes_pct => dw["missed_votes_pct"])
			end
		end
end

task :nyt_api_bills => :environment do
  politicians = Politician.all

	politicians.each do |politician|
		request = Unirest.get("http://api.nytimes.com/svc/politics/v3/us/legislative/congress/members/#{politician.bio_guide}.json?api-key=#{Figaro.env.nyt_api_key}").body

		
		sleep 1
		
		politician.update(:bills_sponsored => request["results"][0]["roles"][0]["bills_sponsored"], :bills_cosponsored => request["results"][0]["roles"][0]["bills_cosponsored"])
		
	end
end