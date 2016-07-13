class CreateCases < ActiveRecord::Migration[5.0]
  def change
    create_table :cases do |t|
    	t.string :emergency_number
    	t.string :emergency_name
    	t.string :city
    	t.string :district
    	t.text :address
    	t.text :comment
    	t.integer :nanny_id ,:index => true
    	t.integer :parent_id ,:index => true
    	t.integer :child_id ,:index => true
    	t.datetime :date
    	t.integer :start_time
    	t.integer :end_time
    	t.string :status
      t.timestamps
    end
  end
end
