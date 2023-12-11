class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.integer :lease_id
      t.date :date
      t.decimal :amount
      t.integer :payment_method
      t.integer :month
      t.integer :year

      t.timestamps
    end
  end
end
