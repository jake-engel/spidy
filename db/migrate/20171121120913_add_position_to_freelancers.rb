class AddPositionToFreelancers < ActiveRecord::Migration[5.1]
  def change
    add_column :freelancers, :position, :string
  end
end
