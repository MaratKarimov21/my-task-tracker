module Types
  module Payloads
    class FinishTaskType < Types::BaseObject
      field :task, Types::TaskType, null: false
    end
  end
end
