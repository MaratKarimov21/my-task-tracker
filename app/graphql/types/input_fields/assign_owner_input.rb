module Types
  module InputFields
    class AssignOwnerInput < Types::BaseInputObject
      argument :user_id, ID, required: true
      argument :task_id, ID, required: true
    end
  end
end