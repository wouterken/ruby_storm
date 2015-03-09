module Storm
  class Version
    def self.to_s(*args)
      "0.0.2"
    end
    alias_method :start, :to_s
  end
end