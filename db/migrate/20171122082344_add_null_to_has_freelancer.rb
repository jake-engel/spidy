class AddNullToHasFreelancer < ActiveRecord::Migration[5.1]
  def change
    change_column_null(:users, :has_freelancer, false)
  end
end
