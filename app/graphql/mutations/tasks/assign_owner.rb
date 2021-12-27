module Mutations
  module Tasks
    class AssignOwner < BaseMutation
      include AuthenticableGraphqlUser

      argument :input, Types::InputFields::AssignOwnerInput, required: true

      type Types::Payloads::AssignOwnerType

      def resolve(input:)
        @params = input.to_h
        
        authorize! task, to: :assign_owner?, with: TaskPolicy

        assign_owner.success? ? assign_owner : execution_error(error_data: assign_owner.error_data)
      end

      private

      attr_accessor :params

      def assign_owner
        @assign_owner = ::Tasks::AssignOwner.call({
          task: task,
          user: user
        })
      end

      def task
        @task = Task.find(params[:task_id])
      end

      def user
        @user = Task.find(params[:user_id])
      end
      
    end
  end
end
