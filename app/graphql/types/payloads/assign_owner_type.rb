module Types
  module Payloads
    class AssignOwnerType < Types::BaseObject
      field :task, Types::TaskType, null: false
      field :user, Types::UserType, null: false
    end
  end
end