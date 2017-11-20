class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :body
      t.references :user, foreign_key: true
      t.references :offer, foreign_key: true
      t.string :date

      t.timestamps
    end
  end
end
