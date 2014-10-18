class AddImageUrlAndVideoUrlToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :image_url, :string
    add_column :recipes, :video_url, :string
  end
end
