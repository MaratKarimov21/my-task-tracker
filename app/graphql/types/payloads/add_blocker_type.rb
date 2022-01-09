module Types
  module Payloads
    class AddBlockerType < Types::BaseObject
      field :blocked_task, Types::TaskType, null: false
      field :blocker_task, Types::TaskType, null: false
    end
  end
end