module Types
  module InputFields
    class UpdateTaskInput < Types::BaseInputObject
      argument :task_id, Integer, required: true
      argument :title, String, required: true
      argument :kind, String, required: true
      argument :complexity, Integer, required: true
    end
  end
end