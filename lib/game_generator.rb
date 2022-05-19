require './game'

class GameGenerator
  def initialize
    @game = Game.new
    @current_frame = 1
  end

  def generate_game
    TOTAL_FRAMES.times do
      generate_frame_throws
      @current_frame += 1
    end
    @game
  end

  private

  def generate_frame_throws
    throw_one = rand(11)
    throw_two = rand(11 - throw_one)
    @game.throw(throw_one)
    @game.throw(throw_two)
    apply_bonus_throws(throw_one, throw_two) if last_frame?
  end

  def apply_bonus_throws(throw_one, throw_two)
    if throw_one == 10 # Strike
      strike_bonus_throws
    elsif throw_one + throw_two == 10 # Spare
      spare_bonus_throws
    end
  end

  def strike_bonus_throws
    bonus_throw1 = rand(11)
    bonus_throw2 = rand(11)
    @game.throw(bonus_throw1)
    @game.throw(0) if bonus_throw1 == 10
    @game.throw(bonus_throw2)
  end

  def spare_bonus_throws
    bonus_throw = rand(10)
    @game.throw(bonus_throw)
  end

  def last_frame?
    @current_frame == TOTAL_FRAMES
  end
end
