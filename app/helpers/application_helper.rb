# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  # Passes the authenticity token for use in javascript
  def yield_authenticity_token
    if protect_against_forgery?
      javascript_tag <<-JAVASCRIPT
window._auth_token_name = "#{request_forgery_protection_token}";
window._auth_token = "#{form_authenticity_token}";
JAVASCRIPT
    end
  end
end
