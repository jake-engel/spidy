class ReferenceNameChange < ActiveRecord::Migration[5.1]
  def change
    remove_reference(:skills, :freelancers)
    remove_reference(:experiences, :freelancers)
    add_reference :skills, :freelancer, index: true
    add_reference :experiences, :freelancer, index: true
  end
end
