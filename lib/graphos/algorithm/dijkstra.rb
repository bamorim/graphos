require "algorithms"
require "graphos/path"
module Graphos
  module Algorithm
    ##
    # Runs the dijstra algorithm on a given graph
    # at a starting node
    # This uses a Heap to get the lightest edge
    def self.dijkstra graph, initial
      #os paf
      allPaths = Array.new(graph.size)

      #OK #dist[v] = infinito
      costs = Array.new(graph.size, Float::INFINITY)
      #dist[s] = 0
      costs[initial] = 0

      #OK
      heap = BinaryHeap.new{|x,y| x.value <=> y.value}
      heap.push(initial,0)

      update_cost = -> (idx,cost) do
        costs[idx] = cost
        if heap.has_key? idx
          heap.change idx, cost
        else
          heap.push idx, cost
        end
      end

      #Para cada vértice v
      #enquanto heap (S-V) != 0

      while keyval=heap.pop
        idx = keyval.key
        #Selecione u em V-S, tal que dist[u] é mínima
        u = graph[idx]
        distu = costs[idx]
        allPaths[idx] ||= Path.new
        #Para cada vizinho v (edge.to) de u faça
        u.edges.each do |edge|
          #Se dist[v] > dist[u] + w(u,v) então
          if costs[edge.to.index] > distu + edge.weight
            #dist[v] = dist[u] + w(u,v)
            update_cost.call(edge.to.index, distu + edge.weight)
            #criar o Path entre root e v
            #se existe já, tem q atualizar. O novo é o do pai + ele msm
            allPaths[edge.to.index] = allPaths[u.index] + Path.new(edge)
          end
        end
      end

      allPaths
    end

  end
end

