class Category < ActiveRecord::Base
	has_many :recipes
	scope :published,->{where(:published =>true)}
end
