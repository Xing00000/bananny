class AddColumnInfos < ActiveRecord::Migration[5.0]
  def change
  	add_column(:infos, :orther_qualification, :string)
  	add_column(:infos, :optional_requests, :string)
  end
end
