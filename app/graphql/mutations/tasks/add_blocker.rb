module Mutations
  module Tasks
    class AddBlocker < BaseMutation
      include AuthenticableGraphqlUser

      argument :input, Types::InputFields::AddBlockerInput, required: true

      type Types::Payloads::AddBlockerType

      def resolve(input:)
        @params = input.to_h
        
        if create_blocker.success?
          create_blocker
        else
          execution_error(error_data: create_blocker.error_data)
        end
      end

      attr_reader :params

      private

      def create_blocker
        @create_blocker ||= ::Tasks::AddBlocker.call(
          blocker_task: blocker_task,
          blocked_task: blocked_task
        )
      end

      def blocker_task
        @blocker_task ||= ::Task.find(params[:blocker_id])
      end

      def blocked_task
        @blocked_task ||= ::Task.find(params[:blocked_id])
      end
    end
  end
end