require "rails_helper"

describe Mutations::Tasks::AssignOwner do
  include_context "with current user manager"

  let(:user) { create :user, first_name: "Вася"}
  let(:task) { create :task, title: "some title"}

  let(:query) do
    <<-GRAPHQL
    mutation {
      assignOwner(
        input: {
          userId: #{user.id},
          taskId: #{task.id}
        }
      )
      {
      task{
        title
      }
      user{
        firstName
      }
    }
  }
    GRAPHQL
  end

  it_behaves_like "graphql request", "assigns owner" do
    let(:fixture_path) { "json/acceptance/graphql/mutations/tasks/assign_owner/success.json" }
  end
end
