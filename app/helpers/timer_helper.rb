module TimerHelper
  
  # options[:seconds] - How many seconds should this timer start with?
  def timer(options = {})
    seconds = options[:seconds] || 300
    content_tag :span, '', id: 'timer', data: { seconds: seconds } 
  end
end