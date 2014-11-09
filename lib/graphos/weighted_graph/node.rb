module Graphos
  class WeightedGraph

    ##
    # This class represents a node in a weighted graph

    class Node
      attr_reader :index
      def initialize index
        @index = index
        @edges = []
      end

      def add_edge to, weight
        @edges << Edge.new(@index, to, weight)
      end

      def degree
        @edges.inject(0){|sum,e| sum+e.weight }
      end

      def neighbor_of? index
        @edges.any? {|node| node.to.index == index }
      end

      def neighbors
        @edges.map{|edge| edge.to}
      end
    end

  end
end
