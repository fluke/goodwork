class AddSelectedToComments < ActiveRecord::Migration
  def change
    add_column :comments, :selected, :boolean
  end
end
