module Graphos
  class BinaryHeap
    def initialize &compare
      @compare = compare
      @indexes = []
      @keys = []
      @values = []
    end

    def push key, value
      if !has_key? key
        insert key, value
      end
    end

    def has_key? key
      @indexes[key] != nil
    end

    def next
      if key = @keys.first
        key_val key
      end
    end

    def change key, new_value
      if has_key? key
        @values[key] = new_value
        parent_val = @values[parent(@indexes[key])]
        move_up key
        heapify key
      end
    end

    def pop
      return nil if size == 0

      result = key_val(@keys.first)
      @indexes[result.key] = nil
      @values[result.key] = nil

      last = @keys.pop
      if size > 0
        @keys[0] = last 
        @indexes[last] = 0
        heapify last
      end

      result
    end

    def size
      @keys.size
    end

    def ordered
    end

  private
    KeyVal = Struct.new(:key, :value)

    def key_val key
      KeyVal.new(key, @values[key])
    end

    def insert key, value
      @indexes[key] = @keys.size
      @keys.push key
      @values[key] = value

      move_up key
    end

    def heapify key
      left_key = @keys[left(@indexes[key])]
      right_key = @keys[right(@indexes[key])]

      return if !left_key && !right_key

      min_key = [key, left_key, right_key].select{|x| !!x}.sort do |x,y|
        @compare.call(key_val(x), key_val(y))
      end.first

      return if min_key == key

      swap(@indexes[key], @indexes[min_key])
      heapify key
    end

    def move_up key
      while(
        @indexes[key] != 0 && 
        smaller(key_val(key), key_val(@keys[parent(@indexes[key])]))
      )
          swap(parent(@indexes[key]), @indexes[key])
      end
    end

    def parent i
      (i-1)/2
    end

    def left i
      2*i + 1
    end
    def right i
      2*i + 2
    end

    def swap a, b
      @keys[a], @keys[b] = @keys[b], @keys[a]
      @indexes[@keys[a]], @indexes[@keys[b]] = @indexes[@keys[b]], @indexes[@keys[a]]
    end

    def smaller a, b
      @compare.call(a,b) == -1
    end
  end
end
