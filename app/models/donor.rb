class Donor

	attr_reader :industries, :contributors, :total

	def initialize(industry_hash, contributor_hash, total_hash)
		@industries = industry_hash["response"]["industries"]["industry"]
		@contributors = contributor_hash["response"]["contributors"]["contributor"]
		@total = total_hash["response"]["summary"]["@attributes"]
	end

	def self.find(cid)
		politician_hash = Unirest.get("http://www.opensecrets.org/api/?method=candIndustry&cid=#{cid}&cycle=2014&apikey=#{Figaro.env.opensecrets_api_key}&output=json").body

		contributor_hash = Unirest.get("http://www.opensecrets.org/api/?method=candContrib&cid=#{cid}&cycle=2014&apikey=#{Figaro.env.opensecrets_api_key}&output=json").body

		total_contributions_hash = Unirest.get("http://www.opensecrets.org/api/?method=candSummary&cid=#{cid}&cycle=2014&apikey=#{Figaro.env.opensecrets_api_key}&output=json").body
		
    return Donor.new(politician_hash, contributor_hash, total_contributions_hash)
	end

end