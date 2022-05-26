class UserPolicy < ApplicationPolicy
  def show?
    return true if admin?

    record == user
  end

  def edit?
    show?
  end

  def update?
    show?
  end

  def create?
    admin?
  end

  def destroy?
    if admin?
      record != user
    else
      false
    end
  end

  def activate?
    admin?
  end


  class Scope < Scope
    def resolve
      user.has_role?(:admin) ? User.all : User.where(id: user)
    end
  end
end
