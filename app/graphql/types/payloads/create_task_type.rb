module Types
  module Payloads
    class CreateTaskType < Types::BaseObject
      field :task, Types::TaskType, null: false
    end
  end
end