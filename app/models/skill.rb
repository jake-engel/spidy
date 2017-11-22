class Skill < ApplicationRecord
  belongs_to :freelancer

  validates :name, presence: true
end
