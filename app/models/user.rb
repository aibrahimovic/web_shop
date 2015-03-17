class User < ActiveRecord::Base
 
 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true

   has_secure_password
   validates :password, length: { minimum: 5 }

   belongs_to :role
end