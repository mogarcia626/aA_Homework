
def sluggish_octopus(school)
    school.each_with_index do |fish1, i1|
    max_length = true    
        school.each_with_index do |fish2, i2|
        next if i1 == i2
        max_length = false if fish2.length > fish1.length
        end
        
        return fish1 if max_length
    end
    
end

class Array
    def quicksort(&prc)
        prc ||= Proc.new { |x,y| x.length <=> y.length }
        return self if size <= 1
        mid = self[0]
        left = []
        right = []

        self[1..-1].each do |ele|
            prc.call(mid, ele) == 1 ? left << ele : right << ele
        end
        left.quicksort + [mid] + right.quicksort
    end
end

def dominant_octopus(school)
    school.quicksort[-1]
end

def clever_octopus(school)
    prey = ""
    school.each {|fish| prey = fish if fish.length > prey.length }
    prey
end

def slow_dance(pos, tiles)
    tiles.index(pos)
end

def fast_dance(pos, tiles)
    tiles_hash = Hash.new(0)

    tiles.each_with_index do |tile, i|
        tiles_hash[tile] = i
    end

    tiles_hash[pos]
end





# school = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

# p sluggish_octopus(school)
# p dominant_octopus(school)
# p clever_octopus(school)

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

p slow_dance("up", tiles_array)                         # = 0
p slow_dance("right-down", tiles_array)                 # = 3
p fast_dance("up", tiles_array)            # = 0
p fast_dance("right-down", tiles_array)    # = 3
