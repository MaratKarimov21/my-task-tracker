module Tasks
  class Update
    include Interactor::Organizer
    include TransactionalInteractor

    organize Tasks::SaveRecord
  end
end