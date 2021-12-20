module Types 
  class TasksRelationType < Types::BaseObject
    field :blocker, Types::BlockerType, null: false
    field :blocked_id, ID, null: false
  end
end