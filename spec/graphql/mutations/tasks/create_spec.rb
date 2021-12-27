require "rails_helper"

describe Mutations::Tasks::Create do
  include_context "with current user manager"

  let(:query) do
    <<-GRAPHQL
    mutation {
      createTask(
        input: {
          title: "title"
          kind: "feature"
          complexity: 2
        }
      )
    {
      task {
        title
        kind
      }
    }
  }
    GRAPHQL
  end

  it_behaves_like "graphql request", "creates task" do
    let(:fixture_path) { "json/acceptance/graphql/mutations/tasks/create/success.json" }
  end
end
