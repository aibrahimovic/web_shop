require "open-uri"
class Image < ActiveRecord::Base
  belongs_to :product

  has_attached_file :avatar, :styles => {
                      :thumb => "120x120>",
                      :small => "170x170>",
                      :show => "300x300>",
                      :preview => "700x700>",
                      :slider => "1150x350>",
                      #:storage => :s3, #izmjena!!
                  	  #:s3_credentials => Proc.new{|a| a.instance.s3_credentials }, 
                  	  :default_url => "/images/:style/missing.png"
                    }
  
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def picture_from_url(url)
    self.avatar = open(url)
  end 

end

