class Product < ActiveRecord::Base

	belongs_to :category
	has_many :items
	has_attached_file :image, :styles => {
                      :thumb => "120x120>",
                      :small => "150x150>",
                      :show => "200x200>",
                      :preview => "500x500>",
                      :slider => "1150x350>"
                    },
                  :storage => :s3,
                  :s3_credentials => Proc.new{|a| a.instance.s3_credentials }

  def s3_credentials
    {:bucket => "bucket", :access_key_id => "8N029N81", :secret_access_key => "9s83109d3+583493190"}
  end
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	#has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }

	#before_destroy :ensure_not_referenced_by_any_line_item

	 private
		 #def ensure_not_referenced_by_any_line_item
			 #if line_items.empty?
			 	#return true
			 #else
			 	#errors.add(:base, 'Line Items present')
			 	#return false
			 #end
		 #end
end
