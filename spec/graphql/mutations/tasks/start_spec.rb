require "rails_helper"

describe Mutations::Tasks::Start do
  include_context "when time is frozen"
  include_context "with current user manager"

  let(:query) do
    <<-GRAPHQL
    mutation { 
      startTask(
        input: {
          taskId: #{task.id}
        }
      ){
        task{
          startedAt
        }
      }
    }
    GRAPHQL
  end

  let(:task) { create :task }
  
  it_behaves_like "graphql request", "starts task" do
    let(:fixture_path) { "json/acceptance/graphql/mutations/tasks/start/success.json" }
    let(:prepared_fixture_file) do
      fixture_file.gsub(
        /:date/,
        ":date" => current_time.iso8601
      )
    end
  end
end
