class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :title
      t.boolean :published

      t.timestamps
    end
  end
end
