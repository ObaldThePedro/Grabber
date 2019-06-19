class Review < ApplicationRecord
    belongs_to :user
    has_one :item, through: :booking
    belongs_to :booking
end