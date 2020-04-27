class RemoveStringFromListings < ActiveRecord::Migration[5.2]
  def change
    remove_column :listings, :string, :string
  end
end
