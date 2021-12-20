class TaskPolicy < ApplicationPolicy
  def create?
    manage_access?
  end

  def update?
    case user.role
    when "manager", "lead" # Todo: lead can update tasks only in his project
      true
    when "developer"
      user.tasks.include?(record)
    end
  end
  
  def manage_access?
    @manage_access ||= user.role.in?(%w[manager])
  end
end