module Types 
  class TasksRelationType < Types::BaseObject
    field :blocker, Types::BlockerType, null: false
    field :blocked, Types::BlockedType, null: false
  end
end