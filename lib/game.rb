require_relative 'player'
require_relative 'board'

class Game
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
	end
end

new_game = Game.new
puts new_game.rounds