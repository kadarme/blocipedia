class CollaborationPolicy < ApplicationPolicy
    def create?
    user.present? && (record.user == user) && user.role?(:premium)
  end
  
  def new?
    create?
  end
  
  def destroy?
    create?
  end
  
  class Scope < Scope
    def resolve
      scope
    end
  end

end