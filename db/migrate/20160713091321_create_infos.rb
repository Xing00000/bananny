class CreateInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :infos do |t|
    	t.integer :nanny_id , :index => true
    	t.integer :weekday_charge
    	t.integer :holiday_charge
    	t.integer :special_charge
    	t.text :def_special
    	t.text :special
    	t.text :introduction
    	t.integer :min_hour
    	t.integer :case_done
    	t.datetime :since
      t.timestamps
    end
  end
end
