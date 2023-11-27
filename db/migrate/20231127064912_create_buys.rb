class CreateBuys < ActiveRecord::Migration[7.1]
  def change
    create_table :buys do |t|
      t.references :author, foreign_key: { to_table: :users }
      t.references :category, foreign_key: true
      t.string :name
      t.float :amount

      t.timestamps
    end
  end
end
