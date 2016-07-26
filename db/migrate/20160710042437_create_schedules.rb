class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
    	t.integer :nanny_id
    	t.date :date
    	t.integer :helfhour
    	t.timestamps
    end
  end
end
