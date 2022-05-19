require 'terminal-table'

class GamePrinter
  def initialize(game)
    @game = game
    @throws = game.get_throws
    @table = Terminal::Table.new
    @table.title = 'Bowling Game'.green
  end

  def print_game
    set_frame_numbers
    set_frame_scores
    @table << :separator
    set_all_frame_scores
    puts @table
  end

  private

  def set_frame_numbers
    total_frames = @throws.length / 2
    @table.headings = Array.new(total_frames) { |i| (i + 1).to_s.yellow }
  end

  def set_frame_scores
    @table.rows = [@throws.each_slice(2).map { |frame| frame.join(' - ') }]
  end

  def set_all_frame_scores
    arr_score = @game.score_for_all_frames
    @table.add_row arr_score + [arr_score.last.to_s.red]
  end
end
