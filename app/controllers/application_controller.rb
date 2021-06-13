class ApplicationController < ActionController::Base
  def manager_render_404
    render template: "manager/errors/error_404", status: 404, layout: "manager", context_type: "text/html"
  end

  def manager_render_500
    render template: "manager/errors/error_500", status: 500, layout: "manager", context_type: "text/html"
  end
end
