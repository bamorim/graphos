module Graphos
  module Algorithm
    ##
    # Runs the prim algorithm in order to
    # find a MST for a given graph.

    def self.prim graph, initial
      fathers = Array.new(graph.size)

      costs = Array.new(graph.size, Float::INFINITY)
      costs[initial] = 0

      heap = BinaryHeap.new{|x,y| x.value <=> y.value}
      heap.push(initial, 0)

      visited = Array.new(graph.size, false)

      update_cost = -> (idx,cost) do
        costs[idx] = cost
        if heap.has_key? idx
          heap.change idx, cost
        else
          heap.push idx, cost
        end
      end

      while keyval=heap.pop
        idx = keyval.key
        visited[idx] = true
        node = graph[idx]
        node.edges.each do |edge|
          if !visited[edge.to.index] && costs[edge.to.index] > edge.weight
            fathers[edge.to.index] = node.index
            update_cost.call(edge.to.index, edge.weight)
          end
        end
      end

      result = Weighted::Graph.new graph.size
      fathers.each_with_index do |f,c|
        if f
          result.add_edge(f, c, costs[c])
          count += 1
        end
      end
      result
    end

  end
end
