class Change < ActiveRecord::Migration[5.0]
  def change
  	rename_column(:schedules, :start_at, :start_date)
  	rename_column(:schedules, :end_at, :end_date)
  	add_column(:schedules, :text, :string)
  	add_column(:schedules, :case_id, :integer)
  end
end
