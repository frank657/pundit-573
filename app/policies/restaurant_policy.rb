class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin 
        scope.all 
      else 
        scope.where(user: user)
      end
    end
  end

  def create?
    true 
  end

  def show? 
    true 
  end

  def update?
    user_is_owner?
  end

  def destroy?
    user_is_owner?
  end

  private 

  def user_is_owner?
    record.user == user || user.admin
  end
end
