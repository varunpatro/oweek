class RenamePointColInHouse < ActiveRecord::Migration
  def change
  	rename_column :houses, :points_id, :point_id
  end
end
