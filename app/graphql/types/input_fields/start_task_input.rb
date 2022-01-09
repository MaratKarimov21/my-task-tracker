module Types
  module InputFields
    class StartTaskInput < Types::BaseInputObject
      argument :task_id, Integer, required: true
      
    end
  end
end
