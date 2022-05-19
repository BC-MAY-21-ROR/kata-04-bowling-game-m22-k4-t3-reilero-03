class Scorer
  attr_reader :throws

  def initialize
    @throws = Array.new(22) { 0 }
    @current_throw = 0
    @ball = 0
  end

  def throw(pins)
    @throws[@current_throw] = pins
    @current_throw += 1
  end

  def score_for_frame(frame)
    score = 0
    @ball = 0
    frame.times do |_|
      score += if strike?
                 10 + next_two_throws_strike
               elsif spare?
                 10 + next_throw_spare
               else
                 next_throws_frame
               end
      @ball += 2
    end
    score
  end

  def next_two_throws_strike
    if @throws[@ball + 2] == 10
      @throws[@ball + 2] + @throws[@ball + 4]
    else
      @throws[@ball + 2] + @throws[@ball + 3]
    end
  end

  def next_throw_spare
    @throws[@ball + 2]
  end

  def next_throws_frame
    @throws[@ball] + @throws[@ball + 1]
  end

  def strike?
    @throws[@ball] == 10
  end

  def spare?
    @throws[@ball] + @throws[@ball + 1] == 10
  end
end
