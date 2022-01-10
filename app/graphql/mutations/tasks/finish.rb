module Mutations
  module Tasks
    class Finish < BaseMutation
      include AuthenticableGraphqlUser

      argument :input, Types::InputFields::FinishTaskInput, required: true

      type Types::Payloads::FinishTaskType

      def resolve(input:)
        @params = input.to_h

        authorize! task, to: :finish?, with: TaskPolicy

        if start_task.success?
          start_task
        else
          execution_error(error_data: start_task.error_data)
        end
      end

      attr_reader :params

      private

      def task
        @task = Task.find(params[:task_id])
      end

      def start_task
        @start_task ||= ::Tasks::Finish.call(task: task, task_params: { finished_at: Time.now })
      end
    end
  end
end
