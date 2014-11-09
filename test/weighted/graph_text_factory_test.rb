require_relative "../minitest_helper.rb"
require "graphos/weighted/graph"
require "graphos/weighted/text_factory"

class WeightedGraphTextFactoryTest < MiniTest::Test
  def test_text_factory
    graph = Graphos::Weighted::TextFactory.read("test/fixtures/wgraph.txt")

    assert_equal(3, graph.size)
    assert_equal(1.5, graph.edge(0,1).weight)
    assert_equal(2, graph.edge(0,2).weight)
    assert_equal(2.5, graph.edge(1,2).weight)
  end
end
