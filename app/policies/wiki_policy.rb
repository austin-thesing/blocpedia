class WikiPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.premium? || user.admin? # || record.users.include?(user))
        scope.all
      else
        scope.where("private IS NULL OR private = ?", false)
      end
    end
  end
end
