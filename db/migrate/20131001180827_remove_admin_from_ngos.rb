class RemoveAdminFromNgos < ActiveRecord::Migration
  def change
    remove_column :ngos, :admin, :boolean
  end
end
