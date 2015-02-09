class AddHouseIdToPoint < ActiveRecord::Migration
  def change
  	add_column :houses, :points_id, :integer
  end
end
