module Graphos
  class WeightedGraph

    ##
    # This class represents a node in a weighted graph

    class Node
      def initialize index
        @index = index
        @edges = []
      end

      def add_edge to, weight
        @edges << Edge.new(@index, to, weight)
      end

      def degree
        @edges.inject(0){|sum,e| sum+e.weight}
      end
    end

  end
end
