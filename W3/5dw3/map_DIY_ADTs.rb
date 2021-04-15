class Map
    
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

    private
    attr_reader :list
end


