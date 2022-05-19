require_relative 'game'
require_relative 'game_generator'
require_relative 'game_printer'

game_generator = GameGenerator.new

game = game_generator.generate_game
game_printer = GamePrinter.new(game)
game_printer.print_game
