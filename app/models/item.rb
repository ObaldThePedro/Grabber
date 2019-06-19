class Item < ApplicationRecord
    belongs_to :user
    has_many :bookings
    has_many :reviews

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

end
