module GoodsModule

  def goods_names(name = :name)
    goods.map(&name).join(', ')
  end

  def shuffled_goods_names
    shuffled_names = goods.shuffle.map(&:name)
    verbose_goods_names shuffled_names
  end

  def ordered_goods_names
    names = goods.map(&:name) 
    verbose_goods_names names
  end

  def shuffled_goods_statement
    question.display_equation? ? "#{shuffled_verbose_statement}\n#{equation_statement}" : shuffled_verbose_statement
  end

  def ordered_goods_statement
    question.display_equation? ? "#{ordered_verbose_statement}\n#{equation_statement}" : ordered_verbose_statement
  end

  def shuffled_verbose_statement
    verbose_statement shuffled_goods_names
  end

  def ordered_verbose_statement
    verbose_statement ordered_goods_names
  end

  def equation_statement
    "\\( V(#{self.goods_names(:equation_name)}) = [#{goods_utilities}] #{self.lambda >= 0 ? "+ #{self.lambda}" : "#{self.lambda}"} \\)" #changed to be consistent with new value function
  end

  def goods_utilities
    self.goods.map { |good| "u(#{good.equation_name})" }.join(" + ")
  end
  
  def goods_numbers
    self.goods.map(&:number).join(', ')
  end

  def sum_goods_value
    sum = self.goods.map(&:value).reduce(0,:+)
    puts "This #{self.class}'s for #{self.question.number}'s sum goods value is #{sum}" 
    puts "we can see this by adding the following goods"
    accum = 0
    self.goods.each do |good|
      accum += good.value
      puts "good with value #{good.value} and class #{good.class} accumulated is #{accum} "
    end
    sum

  end
  
  def sum_goods_price
    price = self.goods.map(&:price).reduce(0,:+)
    puts "Price is #{price}"
    price
  end

  def update_value_and_utility
    self.value = self.lambda + sum_goods_value #changing the '*' to '+' for new way to calculate
    self.utility = self.value - sum_goods_price
    
    puts "This #{self.class} for #{self.question.number}'s value is #{self.value}"
    puts "this #{self.class} for #{self.question.number}'s utility is #{self.utility}"
  end

  private

  def verbose_goods_names(names)
    names[-1] = "and #{names.last}" if names.size > 1

    if names.size > 2
      names.join(", ")  # Good 1, Good 2, and Good 3
    else
      names.join(" ")   # Good 1 and Good 2
    end
  end

  def verbose_statement(verbose_names)
    "Purchasing #{verbose_names} #{"in an exclusive bundle" if goods.size > 1} makes you value the bundle #{self.lambda >= 0 ? "+ #{self.lambda}" : "#{self.lambda}"} #{self.lambda >= 0 ? "more" : "less"} than if you summed the individual utilities." #changed statement original is here '#{self.lambda == 1 ? "time" : "times"}'
  end
end
