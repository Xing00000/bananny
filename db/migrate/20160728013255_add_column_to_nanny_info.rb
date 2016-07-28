class AddColumnToNannyInfo < ActiveRecord::Migration[5.0]
  def change
  	add_column :infos, :age_0_to_1_cases_done, :integer
  	add_column :infos, :age_1_to_5_cases_done, :integer
  	add_column :infos, :lind_id, :string
  	add_column :infos, :qualification, :string
  	add_column :infos, :license_number, :string
  end

end
