class AddPointIdToHouse < ActiveRecord::Migration
  def change
  	add_column :points, :house_id, :integer
  end
end
