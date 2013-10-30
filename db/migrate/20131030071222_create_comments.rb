class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :data
      t.integer :ngo_id
      t.integer :donation_id

      t.timestamps
    end
  end
end
