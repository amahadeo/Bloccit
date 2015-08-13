class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.present?
        if user.admin? || user.moderator?
          scope.all
        else  
          scope.where(:user_id => user.id)
        end
      else
          scope.where(:user_id => nil)
      end
    end
  end
  
  def index?
    true
  end
  
end