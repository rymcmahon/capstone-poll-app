class AddPartyToPoliticians < ActiveRecord::Migration
  def change
  	add_column :politicians, :party, :string
  end
end
