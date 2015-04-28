class Product < ActiveRecord::Base

	belongs_to :category
	has_many :items
	has_attached_file :image, :styles => {
                      :thumb => "120x120>",
                      :small => "150x150>",
                      :show => "200x200>",
                      :preview => "500x500>",
                      :slider => "1150x350>",
                      #:storage => :s3,
                  	  #:s3_credentials => Proc.new{|a| a.instance.s3_credentials }, 
                  	  :default_url => "/images/:style/missing.png"
                    }

    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
    translates :name, :description
end
