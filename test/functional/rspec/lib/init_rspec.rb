# Require common gems
require 'rspec'
require 'yaml'
require 'rubygems'
require 'active_record'
require 'active_support'
require 'watir'
require 'watir-webdriver'
require 'watir-webdriver/wait'
require 'require_all'


require './lib/r_spec_config'


# Load configuration
RSpecConfig.reload

# Load locales
I18n.locale = RSpecConfig.get(:locale, :language)
I18n.load_path = [Dir.glob("config/locales/*.yml")]


#adapter = RSpecConfig.get(:test_db, :adapter)
#enc = RSpecConfig.get(:test_db, :encoding)
#db = RSpecConfig.get(:test_db, :database)
#pool = RSpecConfig.get(:test_db, :pool)
#username = RSpecConfig.get(:test_db, :username)
#pass = RSpecConfig.get(:test_db, :password)
#host = RSpecConfig.get(:test_db, :host)
#ActiveRecord::Base.establish_connection(:adapter => adapter, :encoding => enc, :database => db, :pool => pool, :username => username, :password =>pass, :host => host)


#Load DB model
#class User < ActiveRecord::Base
#end

#class ImageOrAlbum < ActiveRecord::Base
#end

#class PrivacyLookup < ActiveRecord::Base
#end

#class ImageMembership < ActiveRecord::Base
#end






# Load all helpers and actions
require './lib/helpers/environment_helpers'

require './lib/page_object/page_container'
require './lib/page_object/landing_page'
require './lib/page_object/product_page'
require './lib/page_object/cart_page'
require './lib/page_object/addresses_page'
require './lib/page_object/payment_page'
require './lib/page_object/confirmation_page'
require './lib/page_object/signup_page'
require './lib/page_object/login_page'

require './lib/add_to_cart_shared'
require './lib/address_shared'
require './lib/payment_shared'
require './lib/select_product_shared'
require './lib/log_in_shared'

require './environment/env'



