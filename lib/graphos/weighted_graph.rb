module Graphos

  # :nodoc:
  class WeightedGraph

    require "graphos/weighted_graph/node"
    require "graphos/weighted_graph/edge"

    def initialize size
      @nodes = (0..size-1).map{|i| Node.new i }
    end

    def size
      @nodes.size
    end

    def add_edge from, to, weight
      @nodes[from].add_edge(to,weight)
      @nodes[to].add_edge(from,weight)
    end

    def [] i
      @nodes[i]
    end
  end

end
