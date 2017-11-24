class Freelancer < ApplicationRecord
  belongs_to :user
  has_many :skills, dependent: :destroy, inverse_of: :freelancer
  has_many :experiences, dependent: :destroy, inverse_of: :freelancer
  has_many :offers, dependent: :destroy
  accepts_nested_attributes_for :skills, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :experiences, reject_if: :all_blank, allow_destroy: true

  validates :summary, :hourly_pay, :position, :currency, presence: true
  # Add later when we can figure this out with rails db:seed
  # validates :skills, :length => { :minimum => 1 }
  # validates :experiences, :length => { :minimum => 1 }

  scope :job_title, -> (position) { where("position like ?", "%#{position}%")}
end
