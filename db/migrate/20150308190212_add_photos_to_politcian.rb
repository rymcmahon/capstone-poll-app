class AddPhotosToPolitcian < ActiveRecord::Migration
  def change
  	add_column :politicians, :photo, :string
  end
end
