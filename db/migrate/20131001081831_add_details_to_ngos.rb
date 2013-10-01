class AddDetailsToNgos < ActiveRecord::Migration
  def change
    add_column :ngos, :name, :string
    add_column :ngos, :longdesc, :string
    add_column :ngos, :shortdesc, :string
    add_column :ngos, :location, :string
    add_column :ngos, :phone, :string
  end
end
