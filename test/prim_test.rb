require_relative "minitest_helper.rb"
require "graphos/weighted/graph"
require "graphos/algorithm/prim"

class PrimTest < MiniTest::Test
  def test_prim
    graph = Graphos::Weighted::Graph.new(5)
    graph.add_edge 0, 1, 2
    graph.add_edge 0, 2, 1
    graph.add_edge 0, 4, 1
    graph.add_edge 1, 2, 3
    graph.add_edge 2, 4, 2
    graph.add_edge 2, 3, 4

    mst = Graphos::Algorithm.prim graph, 0

    assert_equal(nil, mst.edge(1,2))
    assert_equal(nil, mst.edge(2,4))
    assert_equal(2, mst.edge(1,0).weight)
    assert_equal(1, mst.edge(0,4).weight)
    assert_equal(1, mst.edge(0,2).weight)
    assert_equal(4, mst.edge(2,3).weight)
  end
end
