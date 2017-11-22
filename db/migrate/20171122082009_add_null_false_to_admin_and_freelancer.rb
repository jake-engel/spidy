class AddNullFalseToAdminAndFreelancer < ActiveRecord::Migration[5.1]
  def change
    change_column_null(:users, :admin, false)
    change_column_null(:users, :admin, false)
  end
end
