module BetaRandom
  class << self
    def get_seconds
      (get_random * 1200).round
    end 
    
    private
    
    def beta_pdf
      @beta_pdf ||= BetaDistribution.new 2, 5
    end

    def get_random
      beta_pdf.icdf rand
    end
  end
end