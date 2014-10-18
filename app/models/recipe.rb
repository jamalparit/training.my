class Recipe < ActiveRecord::Base
	belongs_to :category
	belongs_to :state
	validates_presence_of :title,:description,:ingredients
	validates_length_of :title,:minimum =>5
	validates_uniqueness_of :image_url, :on => :create, :allow_nil => true, :allow_blank=> true

end
