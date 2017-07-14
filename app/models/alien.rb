class Alien < ActiveRecord::Base
  has_many :powers, dependent: :destroy
  
  scope :sorted, lambda { order("aliens.year ASC, aliens.month ASC") }
  validates :name, presence: true
  validates :year, presence: true
  validates :month, presence: true
  validates :origin, presence: true
end
