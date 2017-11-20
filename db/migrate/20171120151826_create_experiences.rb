class CreateExperiences < ActiveRecord::Migration[5.1]
  def change
    create_table :experiences do |t|
      t.string :title
      t.string :company
      t.string :date
      t.string :location
      t.string :picture, default: "SpidyLogo.svg"
      t.text :description

      t.timestamps
    end
  end
end
