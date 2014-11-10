module Graphos
  module Weighted

    # :nodoc:
    class Graph

      require "graphos/weighted/node"
      require "graphos/weighted/edge"

      attr_reader :nodes

      def initialize size
        @nodes = (0..size-1).map{|i| Node.new i }
      end

      def size
        @nodes.size
      end

      def add_edge from, to, weight
        @nodes[from].add_edge(@nodes[to],weight)
        @nodes[to].add_edge(@nodes[from],weight)
      end

      def edge from, to
        @nodes[from].edge(to)
      end

      def [] i
        @nodes[i]
      end

      def each_node
        @nodes.each{|n| yield n}
      end
    end

  end
end
