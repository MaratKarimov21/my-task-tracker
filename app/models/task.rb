class Task < ApplicationRecord
  extend Enumerize

  AVAILABLE_KINDS = %i[feature bug chore]
  AVAILABLE_STATUSES = %i[unstarted started finished]

  has_many :task_users, dependent: :destroy
  has_many :owners, through: :task_users, :source => :user

  belongs_to :requester, class_name: "User", inverse_of: :requested_tasks

  validates :kind, presence: true

  enumerize :kind, in: AVAILABLE_KINDS, predicates: true, scope: :shallow
  enumerize :status, in: AVAILABLE_STATUSES, default: :unstarted, predicates: true, scope: :shallow
end
