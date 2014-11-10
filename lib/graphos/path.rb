module Graphos
  ##
  # This class represents a collection of edges
  # When adding an edge that does not start at
  # the last node, it raises an error

  class Path
    class IncorretPathError < StandardError; end

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
