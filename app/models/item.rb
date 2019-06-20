class Item < ApplicationRecord
    belongs_to :user
    has_many :bookings
    has_many :reviews, through: :bookings
    validates :name, presence: true
    validates :image, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..5.megabytes }
    has_one_attached :image

    
end
    
    





    # def borrowers
    #     self.bookings.map { |booking| booking.user }
    # end


    # def available?
    #     self.bookings.find { |booking| booking.dates.include? Date.today }
    # end

    # def available?
    #     currentDate = Date.now
    #     start_date = Item.booking.start_date
    #     end_date = Item.booking.end_date
    #     currentDate.between?(start_date, end_date)
    # end
