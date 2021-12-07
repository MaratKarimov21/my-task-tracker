class Task < ApplicationRecord
  AVAILABLE_TYPES = %i[feature bug chore]

  has_many :task_users, dependent: :destroy
  has_many :owners, through: :task_users, :source => :user

  belongs_to :requester, class_name: "User", inverse_of: :requested_tasks
end
