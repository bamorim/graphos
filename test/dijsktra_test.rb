require_relative "minitest_helper.rb"
require "graphos/weighted/graph"
require "graphos/algorithm/dijkstra"

class DijkstraTest < MiniTest::Test
  def test_100
    graph = Graphos::Weighted::TextFactory.read("test/fixtures/grafo_1.txt")

    dij = Graphos::Algorithm.dijkstra graph, 0

    assert_equal(19, dij[9].cost)
    assert_equal(24, dij[19].cost)
  end
  def test_dijskstra
    graph = Graphos::Weighted::Graph.new(5)
    graph.add_edge 0, 1, 2
    graph.add_edge 0, 2, 1
    graph.add_edge 0, 4, 1
    graph.add_edge 1, 2, 3
    graph.add_edge 2, 4, 2
    graph.add_edge 2, 3, 4

    dij = Graphos::Algorithm.dijkstra graph, 0

    assert_equal([],ipath(dij[0]))
    assert_equal(0,dij[0].cost)

    assert_equal([1],ipath(dij[1]))
    assert_equal(2,dij[1].cost)

    assert_equal([2],ipath(dij[2]))
    assert_equal(1,dij[2].cost)

    assert_equal([2,3],ipath(dij[3]))
    assert_equal(5,dij[3].cost)

    assert_equal([4],ipath(dij[4]))
    assert_equal(1,dij[4].cost)
  end

private

  def ipath path
    path.path.map{|e| e.to.index}
  end
end
