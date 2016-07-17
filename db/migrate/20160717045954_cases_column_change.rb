class CasesColumnChange < ActiveRecord::Migration[5.0]
  def change
  	remove_column(:cases , :date)
  	remove_column(:cases , :start_time)
  	remove_column(:cases , :end_time)
  	remove_column(:cases , :child_id)
  	add_column :cases, :start_date, :datetime
  	add_column :cases, :end_date, :datetime


  end
end
