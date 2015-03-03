class RemovePartyFromPoliticiansTable < ActiveRecord::Migration
  def change
  	remove_column :politicians, :party
  end
end
