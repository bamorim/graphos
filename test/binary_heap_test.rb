require_relative "minitest_helper.rb"
require "graphos/binary_heap"

class BinaryHeapTest < MiniTest::Test
  def test_binary_heap
    bh = Graphos::BinaryHeap.new{|x,y| x.value <=> y.value}
    bh.push(1,5)
    bh.push(2,4)
    bh.push(3,7)

    assert_equal(2, bh.next.key)
    bh.change(2,6)
    assert_equal(1, bh.next.key)
    bh.change(3,4)
    assert_equal(3, bh.pop.key)
    assert_equal(1, bh.pop.key)
    assert_equal(2, bh.pop.key)
    assert_equal(nil, bh.pop)
  end

  def test_move_up
    bh = Graphos::BinaryHeap.new{|x,y| x.value <=> y.value}
    (1..100).each do |i|
      bh.push(i,Float::INFINITY)
    end

    bh.change(100,1)
    assert_equal(100,bh.next.key)
    bh.change(99,0)
    assert_equal(99,bh.next.key)
  end
end
