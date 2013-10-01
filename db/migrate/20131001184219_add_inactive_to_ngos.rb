class AddInactiveToNgos < ActiveRecord::Migration
  def change
    add_column :ngos, :inactive, :boolean
  end
end
