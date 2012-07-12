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

  # @param [string] array
  def formatted_list(array)
    if array.size == 0
      return ""
    elsif array.size == 1
      return array[0]
    elsif array.size == 2
      return "#{array[0]} and #{array[1]}"
    else
      array_tail = array.pop
      array_rest = array.inject{|string, n| "#{string}, #{n}"}
      return "#{array_rest}, and #{array_tail}"
    end

  end
end
