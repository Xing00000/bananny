class CasesAddColumnCharge < ActiveRecord::Migration[5.0]
  def change
  	add_column :cases, :charge_per_hour, :integer

  end
end
