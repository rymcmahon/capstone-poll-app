class AddCidToPoliticians < ActiveRecord::Migration
  def change
  	add_column :politicians, :cid, :string
  end
end
