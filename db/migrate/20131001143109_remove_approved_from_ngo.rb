class RemoveApprovedFromNgo < ActiveRecord::Migration
  def change
    remove_column :ngos, :approved, :boolean
  end
end
