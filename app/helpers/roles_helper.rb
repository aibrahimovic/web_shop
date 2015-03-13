module RolesHelper

    def is_administrator(user)
      if user.role_id == 1
        return true
      end
    end

    def is_registrated(user)
      if user.role_id == 2
        return true
      end
    end

end