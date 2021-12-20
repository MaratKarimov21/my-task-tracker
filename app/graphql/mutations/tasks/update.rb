module Mutations
  module Tasks
    class Update < BaseMutation
      include AuthenticableGraphqlUser

      argument :input, Types::InputFields::UpdateTaskInput, required: true

      type Types::Payloads::UpdateTaskType

      def resolve(input:)
        @params = input.to_h

        authorize! task, to: :update?, with: TaskPolicy
        
        if update_task.success?
          update_task
        else
          execution_error(error_data: update_task.error_data)
        end
      end

      private

      def update_task
        @update_task ||= ::Tasks::Update.call(task: task, task_params: @params.except(:task_id))
      end

      def task
        task ||= ::Task.find(@params[:task_id])
      end
    end
  end
end