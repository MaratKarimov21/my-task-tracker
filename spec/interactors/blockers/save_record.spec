# frozen_string_literal: true

require "rails_helper"

describe Blockers::SaveRecord do
  include_context "with interactor"

  describe ".call" do
    let(:initial_context) do
      { blocker_params: blocker_params }
    end

    let(:blocker_params) do
      {
        blocker_id: blocker_task.id,
        blocked_id: blocked_task.id
      }
    end

    let(:blocker_task) { create :task }
    let(:blocked_task) { create :task }

    context "when data is valid" do
      it "creates blocker" do
        expect { interactor.run }.to change(Blocker, :count).by(1)

        expect(Blocker.last.reload).to have_attributes(blocker_params)
      end
    end

    context "when data is invalid" do
      let(:blocker_params) do
        {
          blocker_id: nil,
          blocked_id: nil
        }
      end

      let(:error_data) do
        {
          message: "Запись недействительна",
          detail: ["Blocked must exist", "Blocker must exist"]
        }
      end

      it_behaves_like "failed interactor"
    end
  end

end
