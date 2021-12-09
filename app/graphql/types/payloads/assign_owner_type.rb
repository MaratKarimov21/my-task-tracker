module Types
  module Payloads
    class AssignOwnerType < Types::BaseObject
      field :task_user, Types::TaskUserType, null: false
    end
  end
end