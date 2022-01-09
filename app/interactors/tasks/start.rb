module Tasks
  class Start
    include Interactor::Organizer
    include TransactionalInteractor

    organize Tasks::SaveRecord
  end
end
