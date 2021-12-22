module Blockers
  class PrepareParams
    include Interactor

    delegate :blocker_task, :blocked_task, to: :context

    def call
      context.blocker_params = {
        blocker_id: blocker_task.id,
        blocked_id: blocked_task.id
      }
    end
  end
end