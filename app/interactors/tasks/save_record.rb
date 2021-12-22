module Tasks
  class SaveRecord
    include Interactor

    delegate :task, :task_params, to: :context

    def call
      return if task_params.blank?

      context.task ||= Task.new

      context.fail!(error_data: error_data) unless task.update(task_params)

      task.reload
    end

    private

    def error_data
      { message: "record invalid", detail: task.errors.to_a }
    end
  end
end