class AddFullNameToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :full_name, :string
  end
end
