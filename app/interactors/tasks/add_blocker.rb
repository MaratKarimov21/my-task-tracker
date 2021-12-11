module Tasks
  class AddBlocker
    include Interactor::Organizer
    include TransactionalInteractor

    organize TasksRelations::SaveRecord
  end
end