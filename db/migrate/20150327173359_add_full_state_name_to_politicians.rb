class AddFullStateNameToPoliticians < ActiveRecord::Migration
  def change
  	add_column :politicians, :full_state_name, :string
  end
end
