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

  def test_infinity
    bh = Graphos::BinaryHeap.new{|x,y| x.value <=> y.value}
    bh.extend(Simulator)
    costs = Array.new(30, Float::INFINITY)
    [0,3,7,16,22,28].each do |i|
      costs[i] = i
    end

    costs.each_with_index do |v,i|
      bh.push(i,v)
    end

    last = -1
    while pop = bh.pop
      assert_operator last, :<=, pop.value
      last = pop.value
    end
  end

private

  module Simulator
    def get_vals
      @keys.map{|k| @values[k]}
    end
    def simulate index=0, &block
      return if index >= size
      block.call(@values[@keys[index]])
      l = left(index)
      r = right(index)
      if(r < size)
        if(smaller(key_val(@keys[l]), key_val(@keys[r])))
          simulate l, &block
          simulate r, &block
        else
          simulate r, &block
          simulate l, &block
        end
      elsif(l < size)
        simulate l, &block
      end
    end
  end

  def assert_ordered bh
    last = -1
    bh.simulate do |v|
      puts "#{v}"
      assert_operator last, :<=, v
      last = v
    end
  end
end
