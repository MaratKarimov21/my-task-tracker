module Types
  module InputFields
    class AddBlockerInput < Types::BaseInputObject
      argument :blocker_id, Integer, required: true
      argument :blocked_id, Integer, required: true
    end
  end
end