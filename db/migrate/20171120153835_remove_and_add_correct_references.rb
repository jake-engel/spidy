class RemoveAndAddCorrectReferences < ActiveRecord::Migration[5.1]
  def change
    remove_reference(:freelancers, :experience, index: true)
    remove_reference(:freelancers, :skill, index: true)
    add_reference :skills, :freelancers, index: true
    add_reference :experiences, :freelancers, index: true
  end
end
