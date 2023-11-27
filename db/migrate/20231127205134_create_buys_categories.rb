class CreateBuysCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :buys_categories do |t|
      t.references :buy, foreign_key: true
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
