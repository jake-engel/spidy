class ChangeDefaultImageForUser < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:users, :photo, "http://www.vritansh.com/wp-content/uploads/2017/10/placeholder-avatar.png")
  end
end
