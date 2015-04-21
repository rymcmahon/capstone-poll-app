class ChangePartyIdToInteger < ActiveRecord::Migration
  def change
  	change_table :politicians do |t|
  		t.change :party_id, :integer
  	end
  end
end
