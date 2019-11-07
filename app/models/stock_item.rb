class StockItem < ApplicationRecord
  belongs_to :item
  belongs_to :stock
end
