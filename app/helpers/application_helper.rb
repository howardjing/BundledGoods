module ApplicationHelper
  
  # change flash message class to bootstrapped type
  def bootstrapped(type)
    case type
    when :alert
      'alert-warning'
    when :error
      'alert-error'
    when :notice
      'alert-info'
    when :success
      'alert-success'
    else
      type.to_s
    end
  end
  
end
