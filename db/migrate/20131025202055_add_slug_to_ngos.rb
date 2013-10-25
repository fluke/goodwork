class AddSlugToNgos < ActiveRecord::Migration
  def change
    add_column :ngos, :slug, :string
    add_index :ngos, :slug, unique: true
  end
end
