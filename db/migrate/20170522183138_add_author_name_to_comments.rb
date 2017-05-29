class AddAuthorNameToComments < ActiveRecord::Migration[5.0]
  def change
  	add_column :comments, :author_name, :string
  end
end
