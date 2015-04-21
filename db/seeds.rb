# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

politicians = Politician.all

	politicians.each do |politician|
		request = Unirest.get("http://api.nytimes.com/svc/politics/v3/us/legislative/congress/members/#{politician.bio_guide}.json?api-key=df714ef37218ffaab38d3ac293fe9e6a%3A16%3A71448432").body

		
		sleep 1
		
		politician.update(:bills_sponsored => request["results"][0]["roles"][0]["bills_sponsored"], :bills_cosponsored => request["results"][0]["roles"][0]["bills_cosponsored"])
		
	end


