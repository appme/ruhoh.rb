class Ruhoh
  module ConsoleMethods
    def ruhoh
      return @ruhoh if @ruhoh
      @ruhoh = Ruhoh.new
      @ruhoh.setup
      @ruhoh.setup_paths
      @ruhoh
    end

    def reload!
      @ruhoh = nil
      self.ruhoh
    end
  end
end