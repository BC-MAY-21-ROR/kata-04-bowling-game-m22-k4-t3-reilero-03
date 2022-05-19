# frozen_string_literal: true

require_relative 'player'
require_relative 'board'
require 'colorize'
require 'terminal-table'

TOTAL_FRAMES = 10
class Game
  attr_reader :current_frame, :throws

  def initialize
    @throws = Array.new(22) { 0 }
    @first_throw = true
    @current_frame = 0
    @current_throw = 0
  end

  def start
    player = Player.new
    player.get_name
    player.welcome
    TOTAL_FRAMES.times do |i|
      round_one = rand(11)
      round_two = rand(11 - round_one)
      throw(round_one)
      throw(round_two)

     if i == TOTAL_FRAMES - 1 # último Frame
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
    # print "jugada #{i + 1} primer tiro #{round_one} \n"
    # sleep(0.8)
    # print "jugada #{i + 1} segundo tiro #{round_two} \n"
    # sleep(0.8)
    # print "Total frame #{score_for_frame(current_frame) } \n"
    # puts "\n"
      
      rows = []
      rows << ["Intento #{@current_throw - 1}", round_one]
      rows << ["Intento #{@current_throw}", round_two]
      rows << ['Total frame', score_for_frame(current_frame)]
      table = Terminal::Table.new :headings => ["Frame #{i + 1}", 'Puntos'], :rows => rows
      table.title = "Bowling - Game".green
      puts table
      sleep(1)
      print "\e[2J\e[H"

    end

    # a = 1
    # @throws.each do |tiro|
    #   print "Tiro #{a}: #{tiro}\n"
    #   a +=1
    # end
    
    print  "Total Score: #{score} \n"
    arr_score = []
    TOTAL_FRAMES.times do |i|
      arr_score << score_for_frame(i + 1)
    end

    puts "\n"
    print paint_table_score(arr_score)
  end

  def paint_each_game
    table = Terminal::Table.new
    table.title = "Jugadas".green
    table.headings = "Tiro Numero: #{ i + 1}"
    table.rows = round_one
  end

  def paint_table_score(arr_score)
    table = Terminal::Table.new
    table.title = "Bowling - Game".green
    table.headings = Array.new(@throws.length/2).each_with_index.map{|_value, idx|"#{idx + 1}".yellow}
    table.rows = [@throws.each_slice(2).map{|par| par.join(" - ")}]
    table.add_separator
    table.add_row arr_score + ["#{arr_score.last}".red]
    puts table
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
