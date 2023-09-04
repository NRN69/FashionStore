# frozen_string_literal: true

class OrderPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user
  end

  def new?
    create?
  end

  def update?
    user.admin?
  end

  def edit?
    update?
  end

  def destroy?
    user.admin?
  end
end
