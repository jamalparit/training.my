class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :title
      t.boolean :published

      t.timestamps
    end
  end
end
