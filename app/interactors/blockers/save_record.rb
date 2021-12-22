module Blockers
  class SaveRecord
    include Interactor

    delegate :blocker, :blocker_params, to: :context

    def call
      return if blocker_params.blank?

      context.blocker ||= ::Blocker.new

      context.fail!(error_data: error_data) unless blocker.update(blocker_params)
    end

    private

    def error_data
      { message: "record invalid", detail: blocker.errors.to_a }
    end
  end
end