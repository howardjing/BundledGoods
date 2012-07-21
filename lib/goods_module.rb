module GoodsModule

  def goods_names
    self.goods.map(&:name).join(', ')
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
    "Purchasing #{self.shuffled_goods_names} #{"in an exclusive bundle" if self.goods.size > 1} makes you value the bundle #{self.lambda} #{self.lambda == 1 ? "time" : "times"} as much as if you summed the individual utilities."
  end
  
  def goods_numbers
    self.goods.map(&:number).join(', ')
  end

  def sum_goods_value
    self.goods.map(&:value).reduce(0,:+)
  end
  
  def sum_goods_price
    self.goods.map(&:price).reduce(0,:+)
  end

  def update_value_and_utility
    self.value = self.lambda * sum_goods_value
    self.utility = self.value - sum_goods_price
  end
end