require_relative 'player'
require_relative 'board'

class Game
  attr_reader :board
  
  @@count = 0

  def initialize
    @player = Player.new
    @board = Board.new.generate_board
    @game = 10
    @pins = 10
    @score = 0
    @round_one = 0
    @round_two = 0
    @total = 0
    @total_two = 0
  end

  def start
		@player.get_name
		@player.welcome
    puts
    display_board
  end

	def rounds
		@round_one = rand(11)
		@round_two = rand(11 - @round_one)
    @total = @round_one + @round_two
  end

  def display_board
    @board.each_with_index.map do |frame, frame_idx|
      @game.times do
        if @@count == frame_idx
          rounds
          @total_two += @total
          frame[0] = @round_one 
          frame[1] = @round_two
          frame[2] = @total_two
          @@count += 1
        end
      end
    end
    print @board
  end
  # def display_board
  #   board = Board.new.generate_board
  #   board.map do |b|
  #     b.map do |c|
  #       print c
  #     end
  #     print "\n"
  #   end
  # end
end

new_game = Game.new
new_game.start