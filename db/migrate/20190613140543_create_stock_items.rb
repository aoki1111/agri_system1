class CreateStockItems < ActiveRecord::Migration[5.2]
  def change
    create_table :stock_items do |t|
      t.references :item, foreign_key: true
      t.references :stock, foreign_key: true

      t.timestamps
    end
  end
end
