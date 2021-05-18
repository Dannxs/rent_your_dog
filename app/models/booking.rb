class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :dog

  enum status: { pending: 0, accepted: 1, refused: 2, cancelled: 3 }
end
