class CreateFreelancers < ActiveRecord::Migration[5.1]
  def change
    create_table :freelancers do |t|
      t.integer :hourly_pay
      t.text :summary
      t.integer :completed_jobs, default: 0
      t.float :avg_rating, default: 3.0
      t.string :currency, default: "€"
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
