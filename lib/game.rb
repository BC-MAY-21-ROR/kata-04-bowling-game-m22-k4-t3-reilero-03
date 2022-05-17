require_relative 'player'
require_relative 'board'

class Game
  attr_reader :board

  def initialize
    @player = Player.new
    @game = 10
    @pins = 10
    @score = 0
  end

  def start
		@player.get_name
		@player.welcome
  end

	def rounds
		round_one = rand(11)
		round_two = rand(11 - round_one)

    return ["Player: #{@player.name} \nRound 1: #{round_one}", "Round 2: #{round_two}"]
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
puts new_game.rounds