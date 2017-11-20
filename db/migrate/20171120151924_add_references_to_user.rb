class AddReferencesToUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :freelancers, :experience, index: true
    add_reference :freelancers, :skill, index: true
  end
end
