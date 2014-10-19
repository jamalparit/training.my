class Category < ActiveRecord::Base
	has_many :recipes
	scope :published,->{where(:published =>true)}
	#scope :belumsah,-> {where("published = false or published is null")}
end
