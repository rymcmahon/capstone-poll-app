class RemovePhotosFromPoliticians < ActiveRecord::Migration
  def change
  	remove_column :politicians, :photo, :string
  	add_column :politicians, :bio_guide, :string
  end
end
