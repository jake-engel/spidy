class Skill < ApplicationRecord
  belongs_to :freelancer, inverse_of: :skills

  validates :name, presence: true
end
