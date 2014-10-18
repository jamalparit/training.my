json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :title, :description, :ingredients, :directions, :category_id, :published
  json.url recipe_url(recipe, format: :json)
end
