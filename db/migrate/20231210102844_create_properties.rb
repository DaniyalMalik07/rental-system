class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.text :address
      t.decimal :advance_amount
      t.decimal :rent_amount
      t.integer :status, default: 0
      t.integer :owner_id

      t.timestamps
    end

    add_index :properties, :status
    add_index :properties, :owner_id
  end
end
