class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
    	t.integer :case_id ,:index => true
    	t.text :comment
    	t.integer :user_id,:index => true
      t.timestamps
    end
  end
end
