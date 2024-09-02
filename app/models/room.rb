class Room < ApplicationRecord
  belongs_to :Calification
  belongs_to :Kinds
  belongs_to :Hotel
end
