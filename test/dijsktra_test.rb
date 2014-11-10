require_relative "minitest_helper.rb"
require "graphos/weighted/graph"
require "graphos/algorithm/dijkstra"

class DijkstraTest < MiniTest::Test
  def test_dijskstra
    graph = Graphos::Weighted::Graph.new(5)
    graph.add_edge 0, 1, 2
    graph.add_edge 0, 2, 1
    graph.add_edge 0, 4, 1
    graph.add_edge 1, 2, 3
    graph.add_edge 2, 4, 2
    graph.add_edge 2, 3, 4

    dij = Graphos::Algorithm.dijkstra graph, graph[0]

    assert_equal([],dij[0])
  end
end
