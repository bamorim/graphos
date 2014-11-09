require_relative "../minitest_helper.rb"
require "graphos/spanning_tree"

class WeightedSpanningTreeTest < MiniTest::Test
  def test_spanning_tree
    st = Graphos::SpanningTree.new 4, 3
    st.set_father! 2, 3, 1
    st.set_father! 1, 3, 2
    st.set_father! 0, 2, 3

    assert_equal nil, st.father(3)
    assert_equal 3, st.father(2)
    assert_equal 3, st.father(1)
    assert_equal 2, st.father(0)

    assert_equal 4, st.distance(0)
    assert_equal 2, st.distance(1)
    assert_equal 1, st.distance(2)
  end
end
