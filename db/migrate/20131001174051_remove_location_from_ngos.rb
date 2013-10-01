class RemoveLocationFromNgos < ActiveRecord::Migration
  def change
  	remove_column :ngos, :location
  end
end
