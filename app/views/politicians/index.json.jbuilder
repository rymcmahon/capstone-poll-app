

json.array! @politicians do |politician|
	json.id politician.id
	json.first_name politician.first_name
	json.last_name politician.last_name
	json.party politician.party.name
	json.state politician.state
	json.full_state_name politician.full_state_name
	json.votes_with_party_pct politician.votes_with_party_pct.to_f
	json.dw_nominate politician.dw_nominate.to_f
	json.missed_votes_pct politician.missed_votes_pct.to_f
	json.bills_sponsored politician.bills_sponsored
	json.bills_cosponsored politician.bills_cosponsored
	json.score politician.score
	json.bio_guide politician.bio_guide
end