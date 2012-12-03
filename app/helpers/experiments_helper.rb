module ExperimentsHelper
  
  def question_explanation(bundle, value, display_formula)
    if display_formula
      formula_explanation(bundle, value)
    else
      verbose_explanation(bundle, value)
    end
  end
  
  private
  
  def formula_explanation(bundle, value)
    bundle_array = JSON.parse(bundle)
    "\\[ v(goods#{bundle}) = #{bundle_array.map { |n| "u(good_#{n})"}.join("+") } #{"+" if value >= 0} #{value} \\]"
  end
  
  def verbose_explanation(bundle, value)
    "Purchasing goods #{bundle} in an exclusive bundle makes you value the bundle + #{value.abs} #{value < 0 ? "less" : "more"} than if you summed the individual utilities."
  end
  
end