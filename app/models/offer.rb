class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :freelancer
  has_many :messages

  validates :price, :price_unit, :budget, :description, presence: true
end
