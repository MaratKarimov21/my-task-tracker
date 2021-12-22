class CreateBlockers < ActiveRecord::Migration[6.0]
  def change
    create_table :blockers do |t|
      t.integer :blocker_id, foreign_key: true
      t.integer :blocked_id, foreign_key: true

      t.timestamps
    end
  end
end
