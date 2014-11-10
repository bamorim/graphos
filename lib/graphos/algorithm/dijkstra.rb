require "algorithms"
require "graphos/path"
module Graphos
  module Algorithm
    include Containers
    ##
    # Runs the dijstra algorithm on a given graph
    # at a starting node
    # This uses a Heap to get the lightest edge
    def self.dijkstra graph, initial
      #OK? E o path?
      fathers = Array.new(graph.size)

      #os paf
      allPaths = Array.new(graph.size)

      #OK #dist[v] = infinito
      costs = Array.new(graph.size, Float::INFINITY)
      #dist[s] = 0
      costs[initial] = 0

      #OK
      heap = Heap.new{|x,y| (costs[x] <=> costs[y]) == -1}
      (0...graph.size).each{|i| heap.push(i)}

      update_cost = -> (idx,cost) do
        costs[idx] = cost
        if(heap.has_key?(idx))
          heap.delete(idx)
          heap.push(idx)
        end
      end

      count = 0

      #Para cada vértice v
      #enquanto heap (S-V) != 0
      while idx=heap.pop
        count += 1
        #Selecione u em V-S, tal que dist[u] é mínima
        u = graph[idx]
        distu = costs[idx]
        allPaths[idx] ||= Path.new
        #Para cada vizinho v (edge.to) de u faça
        u.edges.each do |edge|
          #Se dist[v] > dist[u] + w(u,v) então
          if costs[edge.to.index] > distu + edge.weight
            #dist[v] = dist[u] + w(u,v)
            fathers[edge.to.index] = u.index
            update_cost.call(edge.to.index, distu + edge.weight)
            #criar o Path entre root e v
            #se existe já, tem q atualizar. O novo é o do pai + ele msm
            allPaths[edge.to.index] = allPaths[u.index] + Path.new(edge)
          end
        end

        # No more nodes!
        break if(idx == heap.next)
      end

      allPaths
    end

  end
end

