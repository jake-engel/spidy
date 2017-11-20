class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  has_one :freelancer
  has_many :offers
  has_many :messages
  has_many :experiences, through: :freelancers
  has_many :skills, through: :freelancers
end
