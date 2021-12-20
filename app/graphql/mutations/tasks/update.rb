module Mutations
  module Tasks
    class Update < BaseMutation
      include AuthenticableGraphqlUser

      argument :input, Types::InputFields::CreateTaskInput, required: true

      type Types::Payloads::CreateTaskType

      def resolve(input:)
        @params = input.to_h
        
        authorize! build_task, to: :create?, with: TaskPolicy

        if create_task.success?
          create_task
        else
          execution_error(error_data: create_task.error_data)
        end
      end

      private

      def build_task
        @build_task ||= Task.new(requester_id: current_user.id)
      end

      def create_task
        @create_task ||= ::Tasks::Create.call(task: build_task, task_params: @params)
      end
    end
  end
end