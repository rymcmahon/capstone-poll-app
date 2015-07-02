# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

politicians = Politician.all


	request = Unirest.get("http://api.nytimes.com/svc/politics/v3/us/legislative/congress/114/senate/members/current.json?api-key=df714ef37218ffaab38d3ac293fe9e6a%3A16%3A71448432").body

		request["results"][0]["members"].each do |dw|
			politician = Politician.find_by(:bio_guide => dw["id"])
			if politician
				politician.update(:votes_with_party_pct => dw["votes_with_party_pct"], :missed_votes_pct => dw["missed_votes_pct"])
			end
		end