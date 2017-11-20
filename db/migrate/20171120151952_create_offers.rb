class CreateOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :offers do |t|
      t.references :user, foreign_key: true
      t.integer :price
      t.string :price_unit, default: "hr"
      t.references :freelancer, foreign_key: true
      t.integer :budget
      t.text :description
      t.integer :status, default: 1
      t.integer :rating, default: 5
      t.text :review

      t.timestamps
    end
  end
end
