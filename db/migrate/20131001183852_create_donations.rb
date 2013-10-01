class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :category
      t.string :status
      t.integer :ngo_id
      t.string :ph_no
      t.string :email
      t.string :description

      t.timestamps
    end
  end
end
