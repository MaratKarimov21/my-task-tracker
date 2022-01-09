class TaskPolicy < ApplicationPolicy
  def start?
    record.started_at == nil &&
    record.finished_at == nil &&
    (user.tasks.include?(record) || manage_access?)
  end
  
  def create?
    manage_access?
  end

  def assign_owner?
    manage_access?
  end
  
  def manage_access?
    @manage_access ||= user.role.in?(%w[manager])
  end
end
