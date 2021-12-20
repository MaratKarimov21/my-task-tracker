module Types
  module Payloads
    class UpdateTaskType < Types::BaseObject
      field :task, Types::TaskType, null: false
    end
  end
end