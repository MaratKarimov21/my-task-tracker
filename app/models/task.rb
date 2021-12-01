class Task < ApplicationRecord
  has_many :task_users
  has_many :users, through: :task_users, dependent: :destroy

end
