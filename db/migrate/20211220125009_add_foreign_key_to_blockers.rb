class AddForeignKeyToBlockers < ActiveRecord::Migration[6.0]
  def change
    safety_assured { add_foreign_key :blockers, :tasks, colunm_name: :blocked_id}
    safety_assured { add_foreign_key :blockers, :tasks, colunm_name: :blocker_id}
  end
end
