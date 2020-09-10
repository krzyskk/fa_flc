module ApplicationHelper
  def flash_messages
    flash.map do |key, value|
      alert_class = key == "notice" ? "alert-info" : "alert-danger"
      alert_class.prepend("alert mt-3 ")
      content_tag(:div, value, id: key, class: alert_class)
    end.join.html_safe
  end
end
