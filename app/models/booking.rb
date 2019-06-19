class Booking < ApplicationRecord
    belongs_to :item
    belongs_to :user


    # def dates
    #     self.start_date
    #     self.end_date
    #     # Dates.between(self.start_date, self.end_date)
    # end
end