module TaskUsers
  class PrepareParams
    include Interactor

    delegate :task, :user, to: :context

    def call
      context.task_user_params = task_user_params
    end
    
    private

    def task_user_params
      {
        task_id: task.id,
        user_id: user.id
      }
    end
  end
end