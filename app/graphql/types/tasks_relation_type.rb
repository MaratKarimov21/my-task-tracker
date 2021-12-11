module Types 
  class TasksRelationType < Types::BaseObject
    field :blocker_id, ID, null: false
    field :blocked_id, ID, null: false
  end
end