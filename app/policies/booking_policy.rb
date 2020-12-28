class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def create?
    true
  end

  def new?
    create?
  end

  def show?
    true
  end

  def confirm?
    true
  end
  
  def destroy?
    true
  end
  
  def reject?
    true
  end
  
  def accepted?
    true
  end
  
  def dashboard?
    true
  end

  def checkout?
    true
  end
end
