# frozen_string_literal: true

require_relative 'player'
require_relative 'board'

class Game
  attr_reader :current_frame, :throws

  def initialize
    @throws = Array.new(20) { 0 }
    @first_throw = true
    @current_frame = 0
    @current_throw = 0
    @round_one = 0
    @round_two = 0
  end

  def start
    10.times do
      @round_one = rand(11)
      @round_two = rand(11 - @round_one)
      throw(@round_one)
      throw(@round_two)
      # sleep(1)
      p @throws
      p score_for_frame(@current_frame)
    end
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

    # if frame == 9
    #   if strike(shot)
    #     score += @throws[shot + 2] + @throws[shot + 3]
    #   elsif spare(shot)
    #     score += @throws[shot + 2]
    #   end
    # end

    frame.times do |_|
      score += @throws[shot] + @throws[shot + 1]

      if strike(shot) || strike(shot + 1)
        score += @throws[shot + 2] + @throws[shot + 3]
      elsif spare(shot)
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

  # def rounds
  # 	@round_one = rand(11)
  # 	@round_two = rand(11 - @round_one)
  #   @total = @round_one + @round_two
  # end

  # def display_board
  #   @board.each_with_index.map do |frame, frame_idx|
  #     @game.times do
  #       if @@count == frame_idx
  #         rounds
  #         @total_two += @total
  #         frame[0] = @round_one
  #         frame[1] = @round_two
  #         frame[2] = @total_two
  #         @@count += 1
  #       end
  #     end
  #   end
  #   print @board
  # end
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
