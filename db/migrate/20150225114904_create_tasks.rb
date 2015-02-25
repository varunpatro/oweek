class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :taskLoc
      t.string :taskDesc

      t.timestamps null: false
    end
  end
end
