module TaskUsers
  class SaveRecord
    include Interactor

    delegate :task_user, :task_user_params, to: :context

    def call
      return if task_user_params.blank?

      context.task_user ||= TaskUser.new

      context.fail!(error_data: error_data) unless task_user.update(task_user_params)
    end

    private

    def error_data
      { message: "record invalid", detail: task_user.errors.to_a }
    end
  end
end