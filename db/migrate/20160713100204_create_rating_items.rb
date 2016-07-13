class CreateRatingItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
    	t.integer :rating_id ,:index => true
    	t.string :name
    	t.integer :scored
      t.timestamps
    end
  end
end
