class Room < ApplicationRecord
  has_many :califications
  has_one :room_kind
  belongs_to :hotels


 
    def callName
      self.room_kind&.name || "No Room Kind Assigned"
    end
    
  
end
