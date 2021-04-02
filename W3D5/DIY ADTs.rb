class Stack
    attr_reader :stack
    def initialize
    # create ivar to store stack here!
    @stack = []
    end

    def push(el)
    # adds an element to the stack
    @stack << el if !@stack.include?(el)
    end

    def pop
    # removes one element from the stack
    @stack.pop
    end

    def peek
    # returns, but doesn't remove, the top element in the stack
    @stack[-1]
    end
end

class Queue
    attr_reader :queue

    def initialize
        @queue = []
    end

    def enqueue(el)
        @queue.push(el)
    end

    def dequeue
        @queue.shift
    end
    
    def peek
        @queue.first
    end

end

class Map
    attr_reader :list

    def initialize
        @list = []
    end

    def set(key,value)
        keys = @list.map { |ele| ele[0] }
        if @list.empty? || !keys.include?(key)
            @list << [key, value]
        else
            idx = keys.index(key)
            @list[idx][1] = value       
        end
    end

    def get(key)
       @list.select { |sub| sub[0] == key }[0][1]
    end

    def delete(key)
        @list.reject! { |sub| sub[0] == key }
    end

    def show
        p @list
    end


end


