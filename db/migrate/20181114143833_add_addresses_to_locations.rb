class AddAddressesToLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :address, :string
  end
end
