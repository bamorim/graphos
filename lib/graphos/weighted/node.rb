module Graphos
  module Weighted

    ##
    # This class represents a node in a weighted graph

    class Node
      attr_reader :index, :edges
      def initialize index
        @index = index
        @edges = []
      end

      def add_edge to, weight
        # Does a O(n) check deleting existing edges
        @edges.delete_if{|n| n.to == to}
        @edges << Edge.new(self, to, weight)
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

      def edge to
        @edges.lazy.select{|e| e.to.index == to}.first
      end
    end

  end
end
