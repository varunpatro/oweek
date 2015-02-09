class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.integer :health
      t.integer :attack

      t.timestamps null: false
    end
  end
end
