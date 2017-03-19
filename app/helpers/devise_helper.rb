# :nodoc:
module DeviseHelper
  def devise_error_messages!
    errors = collect_errors
    return '' if errors.empty?
    messages = errors.map { |msg| content_tag(:li, msg) }.join
    html = <<-HTML
    <div id="error_explanation" class='alert alert-warning alert-dismissable fade in'>
      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
      <ul class="list-group list-unstyled">#{messages}</ul>
    </div>
    HTML
    html.html_safe
  end

  def devise_error_messages?
    return unless resource
    !resource.errors.empty?
  end

  def collect_errors
    flash_alerts = []
    [:error, :alert, :notice, :warn].each do |msg|
      flash_alerts.push(flash[msg]) if flash[msg]
    end
    if devise_controller?
      return resource.errors.full_messages unless resource.errors.empty?
    end
    flash_alerts
  end
end
