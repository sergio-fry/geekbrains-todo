class EventPolicy < ApplicationPolicy
  def show?
    return true if user.has_role? :admin

    record.user == user
  end

  def edit?
    show?
  end

  def update?
    show?
  end

  def create?
    show?
  end

  def destroy?
    show?
  end

  class Scope < Scope
    def resolve
      if user.has_role? :admin
        Event.all
      else
        user.events
      end
    end
  end
end
