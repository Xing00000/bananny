class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
    	t.string :type
    	t.string :last_name
    	t.string :frist_name
    	t.string :nickname
    	t.string :gender
    	t.string :mobile_phone ,:index => { :unique => true }
    	t.string :phone
    	t.datetime :birthdate
    	t.string :city
    	t.string :district
    	t.text :address
    	t.integer :user_id
        t.integer :parent_id
        t.string :image
      t.timestamps
    end


  end
end
