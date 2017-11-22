class ChangeDefaultPictureForFreelancerExperience < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:experiences, :picture, "spidy-logo.svg")
  end
end
