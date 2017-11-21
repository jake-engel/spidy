class ChangeFreelancerColumnToHasFreelancer < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :freelancer, :has_freelancer
  end
end
