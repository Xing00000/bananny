class DeleteProfileColumnMobilePhoneUnique < ActiveRecord::Migration[5.0]
  def change
  	remove_index(:profiles, :mobile_phone)
  end
end
