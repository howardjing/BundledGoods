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
    "Purchasing #{self.shuffled_goods_names} #{"together" if self.goods.size > 1} makes you value the bundle #{self.lambda} #{self.lambda == 1 ? "time" : "time"} as much."
  end
end