class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.text :ingredients
      t.text :directions
      t.integer :category_id
      t.boolean :published

      t.timestamps
    end
  end
end
