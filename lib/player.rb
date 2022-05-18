# frozen_string_literal: true

class Player
  attr_reader :name

  def initialize(name = nil)
    @name = name
  end

  def get_name
    puts 'Cual es tu nombre'
    @name = gets.chomp
  end

  def welcome
    print "Hola #{@name}"
  end
end
