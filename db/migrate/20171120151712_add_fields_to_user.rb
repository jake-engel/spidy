class AddFieldsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone_number, :string
    add_column :users, :photo, :string, default: "https://developer.appway.com/filesystem/d6912741f1280a6128b983842c487477225fc90a34614d857290b935c8c2e54a736ac48da2a39d13db50853310e7a9807e5611b45cc9e299/avatar.svg"
    add_column :users, :location, :string
    add_column :users, :admin, :boolean, default: false
    add_column :users, :freelancer, :boolean, default: false
  end
end
