module Storm
  class Version
    def self.to_s(*args)
      "0.0.10"
    end

    def self.start(*args)
      puts self
    end
  end
end