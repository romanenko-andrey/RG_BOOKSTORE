module DeviseHelper
  def devise_error_messages!
    flash_alerts = []
    error_key = 'errors.messages.not_saved'

    if !flash.empty?
      [:error, :alert, :notice, :warn].each do |msg|
        flash_alerts.push(flash[msg]) if flash[msg]
      end
      error_key = 'devise.failure.invalid'
    end
    
    errors = flash_alerts
    if devise_controller?
      errors = resource.errors.full_messages unless resource.errors.empty?
    end

    return "" if errors.empty?

    messages = errors.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t(error_key)

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

  
end

