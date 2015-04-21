class CreatePoliticians < ActiveRecord::Migration
  def change
    create_table :politicians do |t|
      t.string :first_name
      t.string :last_name
      t.string :chamber
      t.string :state
      t.string :votes_with_party_pct
      t.string :missed_votes_pct
      t.string :bills_sponsored
      t.string :bills_cosponsored
      t.string :war_chest

      t.timestamps null: false
    end
  end
end
