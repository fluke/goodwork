class AddLocationToNgos < ActiveRecord::Migration
  def change
    add_column :ngos, :address1, :string
    add_column :ngos, :address2, :string
    add_column :ngos, :city, :string
    add_column :ngos, :state, :string
  end
end
