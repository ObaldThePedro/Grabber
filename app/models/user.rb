class User < ApplicationRecord
    has_many :items 
    has_many :bookings
    has_many :reviews, through: :bookings
    has_secure_password
    validates :email, presence: true, uniqueness: {case_sensitive: false}
    
    
    def borrowed_items
        self.bookings.map {|booking| booking.item }
    end

end
