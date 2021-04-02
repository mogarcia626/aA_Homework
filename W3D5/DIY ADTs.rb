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