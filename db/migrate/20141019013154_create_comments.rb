class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author
      t.text :message
      t.integer :recipe_id
      t.boolean :published

      t.timestamps
    end
  end
end
