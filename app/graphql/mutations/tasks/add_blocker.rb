module Mutations
  module Tasks
    class AddBlocker < BaseMutation
      include AuthenticableGraphqlUser

      argument :input, Types::InputFields::AddBlockerInput, required: true

      type Types::Payloads::AddBlockerType

      def resolve(input:)
        @params = input.to_h
        
        if create_tasks_relation.success?
          create_tasks_relation
        else
          execution_error(error_data: create_tasks_relation.error_data)
        end
      end

      private

      def build_tasks_relation
        @build_tasks_relation ||= TasksRelation.new()
      end

      def create_tasks_relation
        @create_tasks_relation ||= ::Tasks::AddBlocker.call(tasks_relation: build_tasks_relation, tasks_relation_params: @params)
      end
    end
  end
end