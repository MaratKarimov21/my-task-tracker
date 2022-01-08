require "rails_helper"

describe Mutations::Tasks::AddBlocker do
  include_context "with current user"

  let(:blocker) { create :task }
  let(:blocked) { create :task }

  let(:query) do
    <<-GRAPHQL
    mutation {
      addBlocker(
        input: {
          blockerId: #{blocker.id}
          blockedId: #{blocked.id}
        }
      )
      {
        blockedTask{id}
        blockerTask{id}
      }
  }
    GRAPHQL
  end

  it_behaves_like "graphql request", "creates blocker" do
    let(:fixture_path) { "json/acceptance/graphql/mutations/tasks/add_blocker/success.json" }
    let(:prepared_fixture_file) do
      fixture_file.gsub(
        /:blocked_id|:blocker_id/,
        ":blocked_id" => blocked.id,
        ":blocker_id" => blocker.id
      )
    end
  end

  context "when blocker already exists" do

    before do
      Blocker.create!(blocked_id: blocked.id, blocker_id: blocker.id)
    end

    it_behaves_like "graphql request", "returns error" do
      let(:fixture_path) { "json/acceptance/graphql/mutations/tasks/add_blocker/error.json" }
    end
  end
end
