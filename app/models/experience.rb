class Experience < ApplicationRecord
  belongs_to :freelancer, inverse_of: :experiences

  validates :title, :company, :location, :description, presence: true
  mount_uploader :photo, PhotoUploader
end
