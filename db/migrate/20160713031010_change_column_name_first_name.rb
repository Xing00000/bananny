class ChangeColumnNameFirstName < ActiveRecord::Migration[5.0]
  def change
  	rename_column(:profiles, :frist_name, :first_name)
  end
end
