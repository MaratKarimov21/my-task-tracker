module Types
  class TaskKindType < Types::BaseEnum
    value "FEATURE", value: "feature"
    value "BUG", value: "bug"
    value "CHORE", value: "chore"
  end
end