class Politician < ActiveRecord::Base
	belongs_to :party

	def score
		return votes_with_party_pct_score + missed_votes_pct_score + dw_nominate_score + bills_sponsored_score + bills_cosponsored_score
	end

	private

	def votes_with_party_pct_score
			total_score = 0
		if votes_with_party_pct >= 98
			total_score += 0
		elsif votes_with_party_pct >= 96 && votes_with_party_pct < 98
			total_score += 1
		elsif votes_with_party_pct >= 94 && votes_with_party_pct < 96
			total_score += 2
		elsif votes_with_party_pct >= 92 && votes_with_party_pct < 94
			total_score += 3
		elsif votes_with_party_pct >= 90 && votes_with_party_pct < 92
			total_score += 4
		elsif votes_with_party_pct >= 88 && votes_with_party_pct < 90
			total_score += 5
		elsif votes_with_party_pct >= 86 && votes_with_party_pct < 88
			total_score += 6
		elsif votes_with_party_pct >= 84 && votes_with_party_pct < 86
			total_score += 7
		elsif votes_with_party_pct >= 82 && votes_with_party_pct < 84
			total_score += 8
		elsif votes_with_party_pct >= 80 && votes_with_party_pct < 82
			total_score += 9
		elsif votes_with_party_pct >= 78 && votes_with_party_pct < 80
			total_score += 10
		elsif votes_with_party_pct >= 76 && votes_with_party_pct < 78
			total_score += 11
		elsif votes_with_party_pct >= 74 && votes_with_party_pct < 76
			total_score += 12
		elsif votes_with_party_pct >= 72 && votes_with_party_pct < 74
			total_score += 13
		elsif votes_with_party_pct >= 70 && votes_with_party_pct < 72
			total_score += 14
		elsif votes_with_party_pct >= 68 && votes_with_party_pct < 70
			total_score += 15
		elsif votes_with_party_pct >= 66 && votes_with_party_pct < 68
			total_score += 16
		elsif votes_with_party_pct >= 64 && votes_with_party_pct < 66
			total_score += 17
		elsif votes_with_party_pct < 62
			total_score += 18
			
		end
			return total_score
	end

	def missed_votes_pct_score
			total_score = 0
		if missed_votes_pct <= 1
			total_score += 17
		elsif missed_votes_pct > 1 && missed_votes_pct <= 1.25
			total_score += 16
		elsif missed_votes_pct > 1.25 && missed_votes_pct <= 1.5
			total_score += 15
		elsif missed_votes_pct > 1.5 && missed_votes_pct <= 1.75
			total_score += 14
		elsif missed_votes_pct > 1.75 && missed_votes_pct <= 2
			total_score += 13
		elsif missed_votes_pct > 2 && missed_votes_pct <= 2.25
			total_score += 12
		elsif missed_votes_pct > 2.25 && missed_votes_pct <= 2.5
			total_score += 11
		elsif missed_votes_pct > 2.5 && missed_votes_pct <= 2.75
			total_score += 10
		elsif missed_votes_pct > 2.75 && missed_votes_pct <= 3
			total_score += 9
		elsif missed_votes_pct > 3 && missed_votes_pct <= 3.25
			total_score += 8
		elsif missed_votes_pct > 3.25 && missed_votes_pct <= 3.5
			total_score += 7
		elsif missed_votes_pct > 3.5 && missed_votes_pct <= 3.75
			total_score += 6
		elsif missed_votes_pct > 3.75 && missed_votes_pct <= 4
			total_score += 5
		elsif missed_votes_pct > 4 && missed_votes_pct <= 4.25
			total_score += 4
		elsif missed_votes_pct > 4.25 && missed_votes_pct <= 4.5
			total_score += 3
		elsif missed_votes_pct > 4.5 && missed_votes_pct <= 4.75
			total_score += 2
		elsif missed_votes_pct > 4.75 && missed_votes_pct <= 5
			total_score += 1
		elsif missed_votes_pct > 5
			total_score += 0
		end
			return total_score
	end

	def dw_nominate_score
			total_score = 0
		if dw_nominate < 1 && dw_nominate >= 0.900
			total_score += 10
		elsif dw_nominate < 0.900 && dw_nominate >= 0.800
			total_score += 11
		elsif dw_nominate < 0.800 && dw_nominate >= 0.700
			total_score += 12	
		elsif dw_nominate < 0.700 && dw_nominate >= 0.600
			total_score += 13	
		elsif dw_nominate < 0.600 && dw_nominate >= 0.500
			total_score += 14	
		elsif dw_nominate < 0.500 && dw_nominate >= 0.400
			total_score += 15	
		elsif dw_nominate < 0.400 && dw_nominate >= 0.300
			total_score += 16	
		elsif dw_nominate < 0.300 && dw_nominate >= 0.200
			total_score += 17	
		elsif dw_nominate < 0.200 && dw_nominate >= 0.100
			total_score += 18
		elsif dw_nominate < 0.100 
			total_score += 19	
		elsif dw_nominate < 0 && dw_nominate >= -0.100
			total_score += 20 
		elsif dw_nominate < -0.100 && dw_nominate >= -0.150
			total_score += 19
		elsif dw_nominate < -0.150 && dw_nominate >= -0.200
			total_score += 18
		elsif dw_nominate < -0.200 && dw_nominate >= -0.250
			total_score += 17
		elsif dw_nominate < -0.250 && dw_nominate >= -0.300
			total_score += 16 
		elsif dw_nominate < -0.300 && dw_nominate >= -0.350
			total_score += 15
		elsif dw_nominate < -0.350 && dw_nominate >= -0.400
			total_score += 14
		elsif dw_nominate < -0.400 && dw_nominate >= -0.450
			total_score += 13
		elsif dw_nominate < -0.450 && dw_nominate >= -0.500
			total_score += 12
		elsif dw_nominate < -0.500 && dw_nominate >= -0.550
			total_score += 11
		elsif dw_nominate < -0.550
			total_score += 10
		end
			return total_score
	end

	def bills_sponsored_score
			total_score = 0
		if bills_sponsored >= 39
			total_score += 18
		elsif bills_sponsored < 39 && bills_sponsored >= 37
			total_score += 17
		elsif bills_sponsored < 37 && bills_sponsored >= 35
			total_score += 16
		elsif bills_sponsored < 35 && bills_sponsored >= 33
			total_score += 15
		elsif bills_sponsored < 33 && bills_sponsored >= 31
			total_score += 14
		elsif bills_sponsored < 31 && bills_sponsored >= 29
			total_score += 13
		elsif bills_sponsored < 29 && bills_sponsored >= 27
			total_score += 12
		elsif bills_sponsored < 27 && bills_sponsored >= 25
			total_score += 11
		elsif bills_sponsored < 25 && bills_sponsored >= 23
			total_score += 10
		elsif bills_sponsored < 23 && bills_sponsored >= 21
			total_score += 9
		elsif bills_sponsored < 21 && bills_sponsored >= 19
			total_score += 8
		elsif bills_sponsored < 19 && bills_sponsored >= 17
			total_score += 7
		elsif bills_sponsored < 17 && bills_sponsored >= 15
			total_score += 6
		elsif bills_sponsored < 15 && bills_sponsored >= 13
			total_score += 5
		elsif bills_sponsored < 13 && bills_sponsored >= 11
			total_score += 4
		elsif bills_sponsored < 11 && bills_sponsored >= 9
			total_score += 3
		elsif bills_sponsored < 9 && bills_sponsored >= 7
			total_score += 2
		elsif bills_sponsored < 7 && bills_sponsored >= 5
			total_score += 1
		elsif bills_sponsored < 5
			total_score += 0
		end
			return total_score
	end

	def bills_cosponsored_score
			total_score = 0
		if bills_cosponsored >= 100
			total_score += 17
		elsif bills_cosponsored < 100 && bills_cosponsored >= 95
			total_score += 16
		elsif bills_cosponsored < 95 && bills_cosponsored >= 90
			total_score += 15
		elsif bills_cosponsored < 90 && bills_cosponsored >= 85
			total_score += 14
		elsif bills_cosponsored < 85 && bills_cosponsored >= 80
			total_score += 13
		elsif bills_cosponsored < 80 && bills_cosponsored >= 75
			total_score += 12
		elsif bills_cosponsored < 75 && bills_cosponsored >= 70
			total_score += 11
		elsif bills_cosponsored < 70 && bills_cosponsored >= 65
			total_score += 10
		elsif bills_cosponsored < 65 && bills_cosponsored >= 60
			total_score += 9
		elsif bills_cosponsored < 60 && bills_cosponsored >= 55
			total_score += 8
		elsif bills_cosponsored < 55 && bills_cosponsored >= 50
			total_score += 7
		elsif bills_cosponsored < 50 && bills_cosponsored >= 45
			total_score += 6
		elsif bills_cosponsored < 45 && bills_cosponsored >= 40
			total_score += 5
		elsif bills_cosponsored < 40 && bills_cosponsored >= 35
			total_score += 4
		elsif bills_cosponsored < 35 && bills_cosponsored >= 30
			total_score += 3
		elsif bills_cosponsored < 30 && bills_cosponsored >= 25
			total_score += 2
		elsif bills_cosponsored < 25 && bills_cosponsored >= 20
			total_score += 1
		elsif bills_cosponsored < 20
			total_score += 0
		end
			return total_score
	end
end
