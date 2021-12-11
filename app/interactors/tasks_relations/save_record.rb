module TasksRelations
  class SaveRecord
    include Interactor

    delegate :tasks_relation, :tasks_relation_params, to: :context

    def call
      return if tasks_relation_params.blank?

      context.tasks_relation ||= TasksRelation.new

      context.fail!(error_data: error_data) unless tasks_relation.update(tasks_relation_params)
    end

    private

    def error_data
      { message: "record invalid", detail: tasks_relation.errors.to_a }
    end
  end
end