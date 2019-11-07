class AddDescriptionToItems < ActiveRecord::Migration[5.2]
    def change
      create_table :items do |i|
        i.string :item_name
        i.string :area
        i.text :description
    end
  end
end
