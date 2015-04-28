class Category < ActiveRecord::Base
	translates :name
	validates :name, presence: true, uniqueness: true, :case_sensitive => false
end

#Globalize.fallbacks = {:en => [:en, :ba], :ba => [:ba, :en]}

#I18n.locale = :en
#en_category = Category.create(:name => 'en_name')

#I18n.locale = :ba
#ba_category = Category.create(:name => 'ba_name')
#en_category.name

#I18n.locale = :en
#en_category.name
#ba_category.name
