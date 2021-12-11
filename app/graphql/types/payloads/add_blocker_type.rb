module Types
  module Payloads
    class AddBlockerType < Types::BaseObject
      field :tasks_relation, Types::TasksRelationType, null: false
    end
  end
end