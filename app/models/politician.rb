class Politician < ActiveRecord::Base
	belongs_to :party

	def score
		return votes_with_party_pct_score + missed_votes_pct_score
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

end
