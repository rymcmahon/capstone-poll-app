class AddPartyIdtoPoliticiansTable < ActiveRecord::Migration
  def change
  	add_column :politicians, :party_id, :string
  end
end
