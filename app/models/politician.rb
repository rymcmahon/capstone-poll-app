class Politician < ActiveRecord::Base
	belongs_to :party

	def score
		return votes_with_party_pct_score #+
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
end
