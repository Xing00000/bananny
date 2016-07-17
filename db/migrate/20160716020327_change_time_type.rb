class ChangeTimeType < ActiveRecord::Migration[5.0]
  def change
  	add_column(:schedules, :start_at, :datetime)
  	add_column(:schedules, :end_at, :datetime)
  	remove_column(:schedules , :date)
  	remove_column(:schedules , :helfhour)

  end
end
