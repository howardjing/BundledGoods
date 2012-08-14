module BetaRandom
    
  def self.get_seconds
    (get_random * 1200).round
  end
  
  private
  
  def self.beta_pdf
    @beta_pdf ||= BetaDistribution.new 2, 5
  end
  
  def self.get_random
    beta_pdf.icdf rand
  end
  
end