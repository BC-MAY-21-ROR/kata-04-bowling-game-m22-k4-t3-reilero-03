class Board
  def initialize(trie_one, trie_two)
    @trie_one = trie_one
    @trie_two = trie_two
    @total = 0
    @board = nil
  end

  def generate_board
    @board = Array.new(10) {Array.new(3) { 0 }}
  end

  def total_score
    @total = @trie_one + @trie_two
  end

end

