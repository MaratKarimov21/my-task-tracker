module Types
  module InputFields
    class FinishTaskInput < Types::BaseInputObject
      argument :task_id, Integer, required: true
    end
  end
end
