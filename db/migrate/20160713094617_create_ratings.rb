class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
    	t.integer :case_id ,:index => true
    	t.integer :rater_id ,:index => true
    	t.integer :rated_id ,:index => true
    	t.text :feedback

      t.timestamps
    end
  end
end
