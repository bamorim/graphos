require "algorithms"
module Graphos
  module Algorithm
    include Containers

    ##
    # Runs the prim algorithm in order to
    # find a MST for a given graph.

    require "pry"
    def self.prim graph, initial
      fathers = Array.new(graph.size)

      costs = Array.new(graph.size, Float::INFINITY)
      costs[initial] = 0

      heap = Heap.new{|x,y| (costs[x] <=> costs[y]) == -1}
      (0..graph.size-1).each{|i| heap.push(i)}

      update_cost = -> (idx,cost) do
        costs[idx] = cost
        heap.change_key(idx,idx)
      end

      while idx=heap.pop
        node = graph[idx]
        node.edges.each do |edge|
          if costs[edge.to.index] > edge.weight
            fathers[edge.to.index] = node.index
            update_cost.call(edge.to.index, edge.weight)
          end
        end
      end

      result = Weighted::Graph.new graph.size
      fathers.each_with_index do |f,c|
        if f
          result.add_edge(f, c, costs[c])
        end
      end
      result
    end

  end
end
