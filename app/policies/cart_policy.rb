# frozen_string_literal: true

class CartPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def add?
    user
  end

  def new?
    add?
  end

  def update?
    user
  end

  def edit?
    update?
  end

  def remove?
    user
  end
end
