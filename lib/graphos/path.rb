
require "algorithms"
module Graphos
  class Path
    attr_reader :cost, :path
    def initialize edge=nil
      if edge
        @cost = edge.weight
        @path = [edge]
      else
        @cost = 0
        @path = []
      end
    end

    def add_edge edge
      if @path.last.to != edge.from
        raise IncorrectPathError.new
      end
      @path += [node]
      @cost += weight
    end

    def merge! paf
      @cost += paf.cost
      @path = @path + paf.path
    end

    def + path
      dup.tap{|d| d.merge! path }
    end
  end
end
