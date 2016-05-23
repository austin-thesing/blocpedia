module ApplicationHelper
# User Information Helpers
  def display_user_role
    current_user.role.capitalize
  end

  def display_user_email
    current_user.email
  end

  def display_username
    current_user.user_name
  end

  def display_user_name
    current_user.first_name + " " + current_user.last_name
  end
end
