class TaskPolicy < ApplicationPolicy
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