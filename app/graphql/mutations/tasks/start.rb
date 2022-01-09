module Mutations
  module Tasks
    class Start < BaseMutation
      include AuthenticableGraphqlUser

      argument :input, Types::InputFields::StartTaskInput, required: true

      type Types::Payloads::StartTaskType

      def resolve(input:)
        @params = input.to_h
        
        authorize! task, to: :start?, with: TaskPolicy

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
        @start_task ||= ::Tasks::Start.call(task: task, task_params: { started_at: Time.now })
      end
    end
  end
end
