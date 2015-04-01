class Politician < ActiveRecord::Base
	belongs_to :party

	def score
		return votes_with_party_pct_score + missed_votes_pct_score + dw_nominate_score + bills_sponsored_score + bills_cosponsored_score
	end

	private

	def votes_with_party_pct_score
			total_score = 0
		if votes_with_party_pct >= 97
			total_score += 0
		elsif votes_with_party_pct >= 93 && votes_with_party_pct < 97
			total_score += 1
		elsif votes_with_party_pct >= 89 && votes_with_party_pct < 93
			total_score += 2
		elsif votes_with_party_pct >= 85 && votes_with_party_pct < 89
			total_score += 3
		elsif votes_with_party_pct >= 81 && votes_with_party_pct < 85
			total_score += 4
		elsif votes_with_party_pct >= 77 && votes_with_party_pct < 81
			total_score += 5
		elsif votes_with_party_pct >= 73 && votes_with_party_pct < 77
			total_score += 6
		elsif votes_with_party_pct >= 69 && votes_with_party_pct < 73
			total_score += 7
		elsif votes_with_party_pct >= 65 && votes_with_party_pct < 69
			total_score += 8
		elsif votes_with_party_pct >= 61 && votes_with_party_pct < 65
			total_score += 9
		elsif votes_with_party_pct < 61
			total_score += 10
		end
			return total_score
	end

	def missed_votes_pct_score
			total_score = 0
		if missed_votes_pct <= 1
			total_score += 10
		elsif missed_votes_pct > 1 && missed_votes_pct <= 2
			total_score += 9
		elsif missed_votes_pct > 2 && missed_votes_pct <= 3
			total_score += 8
		elsif missed_votes_pct > 3 && missed_votes_pct <= 4
			total_score += 7
		elsif missed_votes_pct > 4 && missed_votes_pct <= 5
			total_score += 6
		elsif missed_votes_pct > 5 && missed_votes_pct <= 6
			total_score += 5
		elsif missed_votes_pct > 6 && missed_votes_pct <= 7
			total_score += 4
		elsif missed_votes_pct > 7 && missed_votes_pct <= 8
			total_score += 3
		elsif missed_votes_pct > 8 && missed_votes_pct <= 9
			total_score += 1
		elsif missed_votes_pct > 9 && missed_votes_pct <= 10
			total_score += 1
		elsif missed_votes_pct > 10
			total_score += 0
		end
			return total_score
	end

	def dw_nominate_score
			total_score = 0
		if dw_nominate < 1 && dw_nominate >= 0.900
			total_score += 0
		elsif dw_nominate < 0.900 && dw_nominate >= 0.800
			total_score += 1
		elsif dw_nominate < 0.800 && dw_nominate >= 0.700
			total_score += 2	
		elsif dw_nominate < 0.700 && dw_nominate >= 0.600
			total_score += 3	
		elsif dw_nominate < 0.600 && dw_nominate >= 0.500
			total_score += 4	
		elsif dw_nominate < 0.500 && dw_nominate >= 0.400
			total_score += 5	
		elsif dw_nominate < 0.400 && dw_nominate >= 0.300
			total_score += 6	
		elsif dw_nominate < 0.300 && dw_nominate >= 0.200
			total_score += 7	
		elsif dw_nominate < 0.200 && dw_nominate >= 0.100
			total_score += 8
		elsif dw_nominate < 0.100 
			total_score += 10	
		elsif dw_nominate < 0 && dw_nominate >= -0.100
			total_score += 10 
		elsif dw_nominate < -0.100 && dw_nominate >= -0.150
			total_score += 9
		elsif dw_nominate < -0.150 && dw_nominate >= -0.200
			total_score += 8
		elsif dw_nominate < -0.200 && dw_nominate >= -0.250
			total_score += 7
		elsif dw_nominate < -0.250 && dw_nominate >= -0.300
			total_score += 6 
		elsif dw_nominate < -0.300 && dw_nominate >= -0.350
			total_score += 5
		elsif dw_nominate < -0.350 && dw_nominate >= -0.400
			total_score += 4
		elsif dw_nominate < -0.400 && dw_nominate >= -0.450
			total_score += 3
		elsif dw_nominate < -0.450 && dw_nominate >= -0.500
			total_score += 2
		elsif dw_nominate < -0.500 && dw_nominate >= -0.550
			total_score += 1
		elsif dw_nominate < -0.550
			total_score += 0
		end
			return total_score
	end

	def bills_sponsored_score
			total_score = 0
		if bills_sponsored >= 55
			total_score += 10
		elsif bills_sponsored < 55 && bills_sponsored >= 50
			total_score += 9
		elsif bills_sponsored < 50 && bills_sponsored >= 45
			total_score += 8
		elsif bills_sponsored < 45 && bills_sponsored >= 40
			total_score += 7
		elsif bills_sponsored < 40 && bills_sponsored >= 35
			total_score += 6
		elsif bills_sponsored < 35 && bills_sponsored >= 30
			total_score += 5
		elsif bills_sponsored < 30 && bills_sponsored >= 25
			total_score += 4
		elsif bills_sponsored < 25 && bills_sponsored >= 20
			total_score += 3
		elsif bills_sponsored < 20 && bills_sponsored >= 15
			total_score += 2
		elsif bills_sponsored < 15 && bills_sponsored >= 10
			total_score += 1
		elsif bills_sponsored < 10
			total_score += 0
		end
			return total_score
	end

	def bills_cosponsored_score
			total_score = 0
		if bills_cosponsored >= 100
			total_score += 10
		elsif bills_cosponsored < 100 && bills_cosponsored >= 90
			total_score += 9
		elsif bills_cosponsored < 90 && bills_cosponsored >= 80
			total_score += 8
		elsif bills_cosponsored < 80 && bills_cosponsored >= 70
			total_score += 7
		elsif bills_cosponsored < 70 && bills_cosponsored >= 60
			total_score += 6
		elsif bills_cosponsored < 60 && bills_cosponsored >= 50
			total_score += 5
		elsif bills_cosponsored < 50 && bills_cosponsored >= 40
			total_score += 4
		elsif bills_cosponsored < 40 && bills_cosponsored >= 30
			total_score += 3
		elsif bills_cosponsored < 30 && bills_cosponsored >= 20
			total_score += 2
		elsif bills_cosponsored < 10 && bills_cosponsored >= 5
			total_score += 1
		elsif bills_cosponsored < 5
			total_score += 0
		end
			return total_score
	end
end
