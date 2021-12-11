class Task < ApplicationRecord
  AVAILABLE_TYPES = %i[feature bug chore]

  has_many :task_users, dependent: :destroy
  has_many :owners, through: :task_users, :source => :user

  has_many :blocker_relations, foreign_key: :blocker_id , class_name: "TasksRelation"
  has_many :blocked, through: :blocker_relations

  has_many :blocked_relations, foreign_key: :blocked_id, class_name: "TasksRelation"
  has_many :blockers, through: :blocked_relations

  belongs_to :requester, class_name: "User", inverse_of: :requested_tasks
end
