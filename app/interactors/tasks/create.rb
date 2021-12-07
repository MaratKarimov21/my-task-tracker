module Tasks
  class Create
    include Interactor::Organizer
    include TransactionalInteractor

    organize Tasks::SaveRecord
  end
end
