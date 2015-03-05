class WikiPolicy < ApplicationPolicy
 
  class Scope
    attr_reader :user, :scope
    
    def initialize(user, scope)
      @user = user
      @scope = scope
    end
    
    def resolve
      if user.present?
        scope.all
      else
        scope.all
      end
    end
  end
      
  def index?
     true
  end
  
  def create?
    user.present? && user.admin?
  end
  
  def edit?
  end
  
  def update?
    create?
  end
  
  def show?
    record.public? || user.present?
  end
  
end