class AddApprovedToNgo < ActiveRecord::Migration
  def self.up
    add_column :ngos, :approved, :boolean, :default => false, :null => false
    add_index  :ngos, :approved
  end

  def self.down
    remove_index  :ngos, :approved
    remove_column :ngos, :approved
  end
end