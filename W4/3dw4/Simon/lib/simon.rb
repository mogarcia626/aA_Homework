class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @seq = []
    @sequence_length = 1
    @game_over = false
  end

  def play
    system('clear')
    until @game_over
      take_turn
      system("clear")
    end
    score = sequence_length - 1
    reset_game
    game_over_message(score)
  end

  def take_turn
    show_sequence
    require_sequence
    sleep 0.15
    round_success_message unless @game_over
    sleep 0.5
    @sequence_length += 1 unless @game_over
  end

  def show_sequence
    add_random_color 
    @seq.each do |color|
      puts color
      sleep 1.5
      system("clear")
      sleep 0.5
    end
  end

  def require_sequence
    puts 'Your Guess:'
    seq.each do |color|
      guess = gets.chomp
      @game_over = true if guess != color 
      break if @game_over == true
    end
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    "Correct! Onto the next round."
  end

  def game_over_message(score)
    "Game Over! your score is #{score}"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
