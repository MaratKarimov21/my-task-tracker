module TaskUsers
  class PrepareParams
    include Interactor

    delegate :task_id, :user_id, to: :context

    def call
      context.task_user_params = task_user_params
    end
    
    private

    def task_user_params
      {
        task_id: task_id,
        user_id: user_id
      }
    end
  end
end