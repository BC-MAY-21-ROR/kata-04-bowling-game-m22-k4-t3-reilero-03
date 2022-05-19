# frozen_string_literal: true

require 'colorize'
require 'terminal-table'
require_relative 'scorer'

TOTAL_FRAMES = 10
class Game
  attr_reader :throws

  def initialize
    @scorer = Scorer.new
    @first_throw = true
    @current_frame = 0
  end

  def throw(pins)
    @scorer.throw(pins)
    adjust_frame
  end

  def adjust_frame
    if @first_throw
      @first_throw = false
    else
      @current_frame += 1
      @first_throw = true
    end
    advance_frame
  end

  def advance_frame
    @current_frame = [TOTAL_FRAMES, @current_frame + 1].min
  end

  def score
    @scorer.score_for_frame(@current_frame)
  end

  def score_for_frame(frame)
    @scorer.score_for_frame(frame)
  end

  def score_for_all_frames
    arr_score = []
    TOTAL_FRAMES.times do |i|
      arr_score << score_for_frame(i + 1)
    end
    arr_score
  end

  def get_throws
    @scorer.throws
  end
end
