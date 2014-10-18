class AddStateIdToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :state_id, :integer
  end
end
