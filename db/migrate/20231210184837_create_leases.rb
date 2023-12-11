class CreateLeases < ActiveRecord::Migration[7.0]
  def change
    create_table :leases do |t|
      t.integer :property_id
      t.integer :tenant_id
      t.date :start_date
      t.date :end_date
      t.decimal :rent_amount
      t.decimal :advance_amount, precision: 10, scale: 2

      t.timestamps
    end
  end
end
