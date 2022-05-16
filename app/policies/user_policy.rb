class UserPolicy < ApplicationPolicy
  def show?
    return true if user.has_role? :admin

    record == user
  end

  def edit?
    show?
  end

  def update?
    show?
  end

  def create?
    user.has_role? :admin
  end

  def destroy?
    if user.has_role?(:admin)
      record != user
    else
      false
    end
  end

  class Scope < Scope
    def resolve
      user.has_role?(:admin) ? User.all : User.where(id: user)
    end
  end
end
