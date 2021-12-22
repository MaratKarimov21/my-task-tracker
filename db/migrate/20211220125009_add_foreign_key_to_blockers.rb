class AddForeignKeyToBlockers < ActiveRecord::Migration[6.0]
  def change
    safety_assured { add_foreign_key :blockers, :tasks, column: :blocked_id}
    safety_assured { add_foreign_key :blockers, :tasks, column: :blocker_id}
  end
end
