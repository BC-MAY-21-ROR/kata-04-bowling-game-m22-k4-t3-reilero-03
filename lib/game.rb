require_relative 'player'
require_relative 'board'

class Game
  attr_reader :current_frame
  
  @@count = 0

  def initialize
    @player = Player.new
    @board = Board.new.generate_board
    @throws = Array.new(20) { 0 }
    @first_throw = true
    @current_throw = 0
    @current_frame = 1
  end

  def start
		@player.get_name
		@player.welcome
    puts
    display_board
  end

  def throw(pins)
    @throws[@current_throw] = pins
    @current_throw += 1
    adjust_frame
  end

  def adjust_frame
    if @first_throw
      @first_throw = false
    else
      @current_frame += 1
      @first_throw = true
    end
  end

  def score_for_frame(frame)
    score = 0
    shot = 0
    frame.times do |_|
      score += @throws[shot] + @throws[shot + 1]

      if(spare(shot))
        score += @throws[shot + 2]
      end

      shot += 2
    end
    score
  end

  def spare(shot)
    @throws[shot] + @throws[shot + 1] == 10
  end

  def strike(shot)
    @throws[shot] == 10
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
