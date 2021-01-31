module ApplicationHelper

  def current_class?(path)
    request.path == path ? "active" : "nav-item"

  end
end
