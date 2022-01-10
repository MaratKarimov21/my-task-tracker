require "rails_helper"

describe Mutations::Tasks::Update do
  include_context "with current user manager"

  let(:description) { "updated description" }
  let(:title) { "updated title" }
  let(:task) { create :task }

  let(:query) do
    <<-GRAPHQL
    mutation {
      updateTask(
        input: {
          task_id: #{task.id}
          description: #{description}
          title: #{title}
        }
      )
    {
      task {
        title
        description
      }
    }
  }
    GRAPHQL
  end

  it_behaves_like "graphql request", "updates task" do
    let(:fixture_path) { "json/acceptance/graphql/mutations/task/update/success.json" }
  end
end
