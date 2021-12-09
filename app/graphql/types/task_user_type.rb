module Types 
  class TaskUserType < Types::BaseObject
    field :user_id, ID, null: false
    field :task_id, ID, null: false
  end
end