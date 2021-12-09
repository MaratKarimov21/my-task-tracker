module TaskUsers
  class AssignOwner
    include Interactor::Organizer
    include TransactionalInteractor

    organize TaskUsers::PrepareParams,
    TaskUsers::SaveRecord
  end
end