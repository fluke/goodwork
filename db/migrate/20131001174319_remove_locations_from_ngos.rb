class RemoveLocationsFromNgos < ActiveRecord::Migration
  def change
    remove_column :ngos, :location, :string
  end
end
