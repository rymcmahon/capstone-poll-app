class ChangePoliticianAttributesToIntegers < ActiveRecord::Migration
  def change
  	change_table :politicians do |t|
  		t.change :votes_with_party_pct, :decimal, precision: 5, scale: 2
  		t.change :missed_votes_pct, :decimal, precision: 5, scale: 2
  		t.change :bills_sponsored, :integer
  		t.change :bills_cosponsored, :integer
  		t.change :war_chest, :integer
  	end
  end
end
