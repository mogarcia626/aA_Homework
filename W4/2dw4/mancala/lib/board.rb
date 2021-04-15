class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @cups = Array.new(14) {Array.new}
    place_stones
  end

  def place_stones
    (0..5).each { |i| 4.times { @cups[i] << :stone } }
    (7..12).each { |i| 4.times { @cups[i] << :stone } }
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos == 6 || start_pos > 12
    raise "Starting cup is empty" if @cups[start_pos].empty?
    true
  end

  def make_move(start_pos, current_player_name)
   
    stones = @cups[start_pos].dup
    @cups[start_pos] = []

    idx = start_pos
    until stones.empty?
      idx += 1
      idx = 0 if idx > 13
      next if current_player_name == @player1 && idx == 13
      next if current_player_name == @player2 && idx == 6
      @cups[idx] << stones.pop
    end
    p "player: #{current_player_name}"
    p "idx = #{idx}"
    render
    next_turn(idx) # end turn cup    
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if @cups[ending_cup_idx].size == 1 && [6,13].none?{|i| i == ending_cup_idx}
      return :switch
    elsif ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  (0..5).all? { |cup| @cups[cup].empty? } || 
  (7..12).all? { |cup| @cups[cup].empty? }
  end

  def winner
    if @cups[6].length > @cups[13].length
      return @player1 
    elsif @cups[13].length > @cups[6].length
      return @player2
    else
      return :draw
    end
  end

end
