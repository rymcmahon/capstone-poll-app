class Party < ActiveRecord::Base
	has_many :politicians, foreign_key: :party_id
end
