module Types
  module InputFields
    class CreateTaskInput < Types::BaseInputObject
      argument :title, String, required: true
      argument :kind, String, required: true
      argument :complexity, Integer, required: true
    end
  end
end