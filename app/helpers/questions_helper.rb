module QuestionsHelper
  
  def menu_name(obj)
    "#{obj.menu_name}: #{number_to_currency obj.price}"
    
  end
end
