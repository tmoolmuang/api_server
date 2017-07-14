class Power < ActiveRecord::Base
  belongs_to :alien
  
  validates :ability, presence: true
end
