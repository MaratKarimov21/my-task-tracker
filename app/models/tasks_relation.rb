class TasksRelation < ApplicationRecord
  belongs_to :blocked, class_name: "Task"
  belongs_to :blocker, class_name: "Task"

  validates :blocker_id, uniqueness: { scope: :blocked_id }
end
