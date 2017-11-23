class SetDefaultLocationOfUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :location, :string, :default => 'Amsterdam'
  end
end
