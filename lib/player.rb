# frozen_string_literal: true

# This class ask the name to the player and give a greetings
class Player
  attr_reader :name

  def initialize(name = nil)
    @name = name
  end

  def ask_name
    puts 'Hello...'
    sleep(1)
    puts 'What is your name?'
    @name = gets.chomp
  end

  def welcome
    sleep(0.5)
    print "Hi! #{@name} \n"
    sleep(1)
    print "Welcome to the bowling game \n"
    sleep(1)
  end
end

# player = Player.new
# player.get_name
# player.welcome
