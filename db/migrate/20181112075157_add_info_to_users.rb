class AddInfoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_scout, :boolean
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :location, :string
  end
end
