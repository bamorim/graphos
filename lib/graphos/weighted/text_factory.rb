module Graphos
  module Weighted
    module TextFactory
      def self.read path
        lines = IO.readlines(path)
        graph = Graph.new(lines[0].to_i)
        lines[1..-1].each do |line|
          args = line.split(/[ \n]+/)
          graph.add_edge args[0].to_i-1, args[1].to_i-1, args[2].to_f
        end
        graph
      end
    end
  end
end
