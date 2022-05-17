class Board

  def initialize()
    @trie_one = nil
    @trie_two = nil
    @total = 0
    @board = nil
  end

  def generate_board
    @board = Array.new(10) { Array.new(3) { '|__' } }
  end

  def total_score
    @total = @trie_one + @trie_two
  end
end