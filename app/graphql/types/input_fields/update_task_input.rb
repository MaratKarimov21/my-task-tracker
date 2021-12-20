module Types
  module InputFields
    class UpdateTaskInput < Types::BaseInputObject
      argument :task_id, Integer, required: true
      argument :title, String, required: false
      argument :description, String, required: false
    end
  end
end