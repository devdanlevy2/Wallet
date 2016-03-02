class CreateExchanges < ActiveRecord::Migration
  def change
    create_table :exchanges do |t|
      t.decimal :amount
      t.string :recipient

      t.timestamps null: false
    end
  end
end
