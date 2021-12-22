module Types
  module InputFields
    class AssignOwnerInput < Types::BaseInputObject
      argument :user_id, Integer, required: true
      argument :task_id, Integer, required: true
    end
  end
end