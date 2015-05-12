class Image < ActiveRecord::Base
  belongs_to :product

  has_attached_file :avatar, :styles => {
                      :thumb => "120x120>",
                      :small => "150x150>",
                      :show => "200x200>",
                      :preview => "500x500>",
                      :slider => "1150x350>",
                      #:storage => :s3, #izmjena!!
                  	  #:s3_credentials => Proc.new{|a| a.instance.s3_credentials }, 
                  	  :default_url => "/images/:style/missing.png"
                    }
            

  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
