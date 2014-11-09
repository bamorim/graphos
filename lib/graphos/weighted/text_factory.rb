module Graphos
  module Weighted
    module TextFactory
      def self.read path
        f = File.open(path,"r")
        graph = Graph.new(f.gets.to_i)
        while(line=f.gets)
          args = line.split(/[ \n]+/)
          graph.add_edge args[0].to_i-1, args[1].to_i-1, args[2].to_f
        end
        graph
      end
    end
  end
end
