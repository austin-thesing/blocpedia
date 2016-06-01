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

  def display_collaborator_name(user)
    user.first_name + " " + user.last_name
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
