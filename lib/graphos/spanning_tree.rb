# TODO: father(a)
# TODO: add_father!(a,b)
# TODO: path(a,b)

module Graphos
    # :nodoc:
    class SpanningTree
      def initialize size, root
        @distances = Array.new(size,Float::INFINITY)
        @distances[root] = 0
        @fathers = Array.new(size,nil)
      end

      def set_father! child, father, weight=1
        @fathers[child] = father
        @distances[child] = @distances[father] + weight
      end

      def father child
        @fathers[child]
      end

      def distance child
        @distances[child]
      end
    end

end
