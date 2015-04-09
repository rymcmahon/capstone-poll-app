class AddElectionYearToPoliticians < ActiveRecord::Migration
  def change
  	add_column :politicians, :election_year, :string
  end
end
