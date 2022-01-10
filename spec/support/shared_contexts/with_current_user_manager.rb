shared_context "with current user manager" do
  let(:schema_context) { { current_user: current_user, token_payload: token_payload.stringify_keys } }
  let(:token_payload) { { type: "access" } }
  let(:current_user) { create :user, :manager, :with_data }
end
