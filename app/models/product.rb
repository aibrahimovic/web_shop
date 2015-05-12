class Product < ActiveRecord::Base

	belongs_to :category
	has_many :items
	has_attached_file :image, :styles => {
                      :thumb => "120x120>",
                      :small => "150x150>",
                      :show => "200x200>",
                      :preview => "500x500>",
                      :slider => "300x300>",
                      #:storage => :s3, #izmjena!!
                  	  #:s3_credentials => Proc.new{|a| a.instance.s3_credentials }, 
                  	  :default_url => "/images/:style/missing.png"
                    }

    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
    translates :name, :description


  def get_price
    if self.sale == ""
      @price = self.price
    else
      @price = self.sale
    end

    @price
  end

  def get_percent
    if self.sale != ""
      @percent = 100*(1-self.sale.to_f/self.price.to_f)
  
      if @percent != @percent.round
        @percent = @percent.round(2)
      else
        @percent.round
      end
    end
  
    @percent
  end


end
