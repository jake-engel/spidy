class Freelancer < ApplicationRecord
  belongs_to :user
  has_many :skills, dependent: :destroy
  has_many :experiences, dependent: :destroy
  has_many :offers, dependent: :destroy

  validates :summary, :hourly_pay, :position, :currency, presence: true
end
