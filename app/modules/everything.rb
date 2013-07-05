module Everything
  def self.included(base)
    base.scope :everything, lambda { base.where("1=1") }
  end
end