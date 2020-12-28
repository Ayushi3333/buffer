class BuddyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def create?
    if !user.nil?
      true
    end
  end

  def new?
    create?
  end

  def show?
    true
  end

  def update?
    !user.nil?
  end

  def edit?
    update?
  end

  def destroy?
    !user.nil?
  end

end
