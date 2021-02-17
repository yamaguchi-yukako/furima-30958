class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :text, null: false
      t.integer :price, null: false
      t.integer :category_id, null: false
      t.integer :condition_id , null: false
      t.integer :cost_id , null: false
      t.integer :prefecture_code_id, null: false
      t.integer :day_id, null: false


      t.timestamps null: false
    end
  end
end
