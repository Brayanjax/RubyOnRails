class Reservation < ApplicationRecord
  belongs_to :User
  belongs_to :Room
end
