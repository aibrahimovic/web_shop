class Category < ActiveRecord::Base
	translates :name
	validates :name, presence: true, uniqueness: true, :case_sensitive => false
end

#Globalize.fallbacks = {:en => [:en, :bs], :bs => [:bs, :en]}
