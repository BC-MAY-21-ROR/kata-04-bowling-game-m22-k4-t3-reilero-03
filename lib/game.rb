# frozen_string_literal: true

require_relative 'player'
require_relative 'board'

TOTAL_FRAMES = 3
class Game
  attr_reader :current_frame, :throws

  def initialize
    @throws = Array.new(22) { 0 }
    @first_throw = true
    @current_frame = 0
    @current_throw = 0
  end

  def start
    TOTAL_FRAMES.times do |i|
      round_one = rand(11)
      round_two = rand(11 - round_one)
      throw(round_one)
      throw(round_two)

     if i == TOTAL_FRAMES - 1 # última Frame
      throw_bonus_1 = rand(10)
      throw_bonus_2 = rand(10)
      if round_one == 10 # Último frame strike
        if throw_bonus_1 == 10 # Strike
          throw(throw_bonus_1)
          throw(0)
          throw(throw_bonus_2)
        else
          throw(throw_bonus_1)
          throw(throw_bonus_2)
        end
      elsif round_one + round_two == 10 
        throw(throw_bonus_1)
      end
     end
    end

    p @throws
    p score
    TOTAL_FRAMES.times do |i|
      print "#{score_for_frame(i + 1)} "
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
    @current_frame = [TOTAL_FRAMES, @current_frame + 1].min
  end

  def score
    score_for_frame(@current_frame)
  end

  def score_for_frame(frame)
    score = 0
    shot = 0
    frame.times do |_|
      if strike(shot)
        if strike(shot + 2)
          score += 10 + @throws[shot + 2] + @throws[shot + 4]
        else
          score += 10 + @throws[shot + 2] + @throws[shot + 3]
        end
      elsif spare(shot)
        score += 10 + @throws[shot + 2]
      else 
        score += @throws[shot] + @throws[shot + 1]
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

  def game_over
    @current_frame == TOTAL_FRAMES
  end

end

game = Game.new
game.start

# class Player
#   attr_reader :name
#   def initialize(name)
#     @name = name
#   end
# end
# class Bowling
#   def initialize()
#     player_1 = Player.new('Augustin')
#     game_player_1 = Game.new
#     player_2 = Player.new('Nicolás')
#     game_player_2 = Game.new
#   end
# 
#   def play
#     if !game_player_1.game_over
#       player_1_throws = player_1.get_throws
#       game.throw(player_1_throws)
#     end
#     if !game_player_1.game_over
#       player_1_throws = player_1.get_throws
#       game.throw(player_1_throws)
#     end
#     if game_player_1.game_over && game_player_2.game_over
# 
#     end
#   end
# 
# end
