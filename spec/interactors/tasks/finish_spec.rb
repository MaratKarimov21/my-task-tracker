require "rails_helper"

describe Mutations::Tasks::Finish do
  include_context "when time is frozen"
  include_context "with current user manager"

  let(:query) do
    <<-GRAPHQL
    mutation { 
      finishTask(
        input: {
          taskId: #{task.id}
        }
      ){
        task{
          finishedAt
        }
      }
    }
    GRAPHQL
  end

  let(:task) { create :task, started_at: 1.hour.ago }

  it_behaves_like "graphql request", "starts task" do
    let(:fixture_path) { "json/acceptance/graphql/mutations/tasks/finish/success.json" }
    let(:prepared_fixture_file) do
      fixture_file.gsub(
        /:date/,
        ":date" => current_time.iso8601
      )
    end
  end
end
