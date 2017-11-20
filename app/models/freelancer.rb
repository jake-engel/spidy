class Freelancer < ApplicationRecord
  belongs_to :user
  has_many :skills
  has_many :experiences
  has_many :offers
end
