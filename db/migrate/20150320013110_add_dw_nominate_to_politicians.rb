class AddDwNominateToPoliticians < ActiveRecord::Migration
  def change
  	add_column :politicians, :dw_nominate, :decimal, precision: 5, scale: 3
  end
end
