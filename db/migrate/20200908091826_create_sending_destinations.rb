class CreateSendingDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :sending_destinations do |t|
      t.string  :post_code,    null: false
      t.integer :prefecture_id,   null: false
      t.string  :city,         null: false
      t.integer :house_number, null: false
      t.string  :building_name
      t.string  :phone_number, null: false
      t.integer :purchase_id,  foreign_key: true

      t.timestamps
    end
  end
end
