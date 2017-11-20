class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :freelancer
  belongs_to :skills, through: :freelancers
  belongs_to :experiences, through: :freelancers
  has_many :messages
end
