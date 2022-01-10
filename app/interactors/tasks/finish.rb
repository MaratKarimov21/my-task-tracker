module Tasks
  class Finish
    include Interactor::Organizer
    include TransactionalInteractor

    organize Tasks::SaveRecord
  end
end
