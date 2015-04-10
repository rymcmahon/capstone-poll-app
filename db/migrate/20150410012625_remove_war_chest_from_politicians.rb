class RemoveWarChestFromPoliticians < ActiveRecord::Migration
  def change
  	remove_column :politicians, :war_chest
  end
end
