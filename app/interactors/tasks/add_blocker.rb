module Tasks
  class AddBlocker
    include Interactor::Organizer
    include TransactionalInteractor

    organize Blockers::PrepareParams,
    Blockers::SaveRecord
  end
end