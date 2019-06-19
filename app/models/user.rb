class User < ApplicationRecord
    has_many :items 
    has_many :bookings
    has_many :reviews, through: :bookings
    
    has_secure_password
    validates :email ,presence: true, uniqueness: {case_sensitive: false}
    validates :password, confirmation: true
    validates :password_confirmation, presence: true
    before_save :downcase_email

    def downcase_email
        self.email.downcase!
    end
    

end
