module Types
  module Payloads
    class StartTaskType < Types::BaseObject
      field :task, Types::TaskType, null: false
    end
  end
end
