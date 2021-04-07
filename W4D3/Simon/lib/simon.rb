class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @seq = []
    @sequence_length = 1
    @game_over = false
  end

  def play
    until @game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    round_success_message unless @game_over
    @sequence_length += 1 unless @game_over
  end

  def show_sequence
    add_random_color 
     p seq
  end

  def require_sequence
    seq.each do |color|
      p 'Your Guess:'
      guess = gets.chomp
      @game_over = true if guess != color 
      break if @game_over == true
    end
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    p "Correct! Onto the next round."
  end

  def game_over_message
    p "Game Over! your score is #{@sequence_length-1}"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
