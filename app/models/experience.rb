class Experience < ApplicationRecord
  belongs_to :freelancer

  validates :title, :company, :location, :description, presence: true
end
