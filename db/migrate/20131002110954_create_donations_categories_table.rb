class CreateDonationsCategoriesTable < ActiveRecord::Migration
  
  def self.up
    create_table :ngos_categories, :id => false do |t|
        t.references :ngo
        t.references :category
    end
  end

  def self.down
    drop_table :ngos_categories
  end
  
end
