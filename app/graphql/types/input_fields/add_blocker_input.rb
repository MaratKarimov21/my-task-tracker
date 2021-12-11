module Types
  module InputFields
    class AddBlockerInput < Types::BaseInputObject
      argument :blocker_id, ID, required: true
      argument :blocked_id, ID, required: true
    end
  end
end