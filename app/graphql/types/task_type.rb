module Types 
  class TaskType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :kind, String, null: false
    field :complexity, Integer, null: false
    field :status, String, null: false
    field :description, String, null: true
    field :finished_at, GraphQL::Types::ISO8601DateTime, null: true
    field :requester_id, Integer, null: false
  end
end