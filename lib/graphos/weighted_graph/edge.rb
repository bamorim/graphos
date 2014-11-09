module Graphos
  class WeightedGraph

    ##
    # This class represents an edge in a weighted graph

    class Edge
      attr_reader :from, :to, :weight
      def initialize from, to, weight
        @from, @to, @weight = from, to, weight
      end
    end

  end
end
