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
  #validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]
  #do_not_validate_attachment_file_type :avatar

  def picture_from_url(url)
    u = URI.parse(url)
    self.avatar = open(u)
  end 

end

