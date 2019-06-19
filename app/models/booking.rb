class Booking < ApplicationRecord
    belongs_to :item
    belongs_to :user
    has_one :review


    # def dates
    #     self.start_date
    #     self.end_date
    #     # Dates.between(self.start_date, self.end_date)
    # end
end