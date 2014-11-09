require_relative "minitest_helper.rb"
require "graphos/weighted_graph"

class WeightedGraphTest < MiniTest::Test
  def test_initializing_and_size
    graph = Graphos::WeightedGraph.new 10
    assert_equal(10, graph.size)
  end

  def test_edges
    graph = Graphos::WeightedGraph.new 3
    graph.add_edge(0,1,3)
    graph.add_edge(0,2,2)
    graph.add_edge(1,2,5)

    assert_equal(5, graph[0].degree)
    assert_equal(7, graph[2].degree)
  end
end
