require_relative "minitest_helper.rb"
require "graphos/weighted/graph"

class WeightedGraphTest < MiniTest::Test
  def test_initializing_and_size
    graph = Graphos::Weighted::Graph.new 10
    assert_equal(10, graph.size)
  end

  def test_degrees
    graph = example

    assert_equal(5, graph[0].degree)
    assert_equal(7, graph[2].degree)
  end

  def test_edges
    graph = example
    assert_equal(3, graph.edge(0,1).weight)
  end

  def test_neighborhood
    graph = example

    assert(graph[0].neighbor_of? 1)
    refute(graph[0].neighbor_of? 4)
  end

  def test_get_neighbors
    graph = example

    assert_equal(2, graph[0].neighbors.size)
    assert_equal(3, graph[1].neighbors.size)
  end

private
  
  def example
    graph = Graphos::Weighted::Graph.new 4
    graph.add_edge(0,1,3)
    graph.add_edge(0,2,2)
    graph.add_edge(1,2,5)
    graph.add_edge(1,3,10)
    graph
  end
end
