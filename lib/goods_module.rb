module GoodsModule

  def goods_names(name = :name)
    self.goods.map(&name).join(', ')
  end

  def shuffled_goods_names
    shuffled_names = self.goods.shuffle.map(&:name)
    shuffled_names[-1] = "and #{shuffled_names.last}" if shuffled_names.size > 1

    if shuffled_names.size > 2
      shuffled_names.join(", ")  # Good 1, Good 2, and Good 3
    else
      shuffled_names.join(" ")   # Good 1 and Good 2
    end
  end

  def shuffled_goods_statement
    self.question.display_equation? ? "#{verbose_statement}\n#{equation_statement}" : verbose_statement
  end

  def verbose_statement
    "Purchasing #{self.shuffled_goods_names} #{"in an exclusive bundle" if self.goods.size > 1} makes you value the bundle #{self.lambda} #{self.lambda == 1 ? "time" : "times"} as much as if you summed the individual utilities."
  end

  def equation_statement
    "\\( V(#{self.goods_names(:equation_name)}) = #{lambda}[#{goods_utilities}] \\)"
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
    self.value = self.lambda * sum_goods_value
    self.utility = self.value - sum_goods_price
    
    puts "This #{self.class} for #{self.question.number}'s value is #{self.value}"
    puts "this #{self.class} for #{self.question.number}'s utility is #{self.utility}"
  end
end
