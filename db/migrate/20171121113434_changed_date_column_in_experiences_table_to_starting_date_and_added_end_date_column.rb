class ChangedDateColumnInExperiencesTableToStartingDateAndAddedEndDateColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :experiences, :date, :starting_date
    add_column :experiences, :ending_date, :string
  end
end
