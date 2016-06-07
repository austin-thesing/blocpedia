module ApplicationHelper
# User Information Helpers
  def display_user_role
    # if current_user.role == 'standard'
    #   # span with standard class
    # else current_user.role == 'premium'
    #   # span with premium class
    # elsif current_user.role == 'admin'
    #   # span with admin class
    # end
    current_user.role.capitalize
  end

  def display_user_email
    current_user.email
  end

  def display_username
    current_user.username
  end

  def display_name
    current_user.firstname + " " + current_user.lastname
  end

  def display_collaborator_name(user)
    user.firstname + " " + user.lastname
  end

  def markdown(text)
    # sets options hash for Redcarpet markdown renderer
    options = { filter_html: true, hard_wrap: true, space_after_headers: true, fenced_code_blocks: true }
    # sets the extensions for the Redcarpet renderer
    extensions = { autolink: true, superscript: true, disable_indented_code_blocks: true }

    # sets up the renderer and calls the options hash for configuration of settings
    renderer = Redcarpet::Render::HTML.new(options)
    # extends the renderer abilities
    markdown = Redcarpet::Markdown.new(renderer, extensions)
    # renders the actual markdown styled text as .html_safe text
    markdown.render(text).html_safe
  end
end
