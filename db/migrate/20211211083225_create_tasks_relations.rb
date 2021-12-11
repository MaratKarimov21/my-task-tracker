class CreateTasksRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks_relations do |t|
      t.integer :blocker_id, foreign_key: true
      t.integer :blocked_id, foreign_key: true

      t.timestamps
    end
  end
end
