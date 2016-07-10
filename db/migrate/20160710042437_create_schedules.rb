class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
    	t.references :nanny, foreign_key:true
    	t.date :date
    	t.integer :helfhour
    	t.timestamps
    end
  end
end
