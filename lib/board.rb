# frozen_string_literal: true

require 'text-table'
require 'terminal-table'

# This class generate the board for the bowling score
class Board
  def initialize
    @trie_one = nil
    @trie_two = nil
    @total = 0
    @board = nil
  end

  def generate_board
    @board = Array.new(10) { Array.new(3) { '0' } }
  end

  def total_score
    @total = @trie_one + @trie_two
  end
end

# rows = []
# rows << ['One', 1]
# rows << ['Two', 2]
# rows << ['Three', 3]
# table = Terminal::Table.new :headings => ['Word', 'Number'], :rows => rows

# puts table
#
# +-------+---+
# | One   | 1 |
# | Two   | 2 |
# | Three | 3 |
# +-------+---+
