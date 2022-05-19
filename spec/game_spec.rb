require 'game'

describe Game do
  it 'score no strikes & spares' do
    game = Game.new
    game.throw(2)
    game.throw(7)
    game.throw(1)
    game.throw(5)
    game.throw(4)
    game.throw(5)

    expect(game.score_for_frame(3)).to eq(9 + 6 + 9)
    expect(game.score).to eq(9 + 6 + 9)
  end

  it 'score first frame strike' do
    game = Game.new
    game.throw(10)
    game.throw(0)
    game.throw(2)
    game.throw(5)
    game.throw(1)
    game.throw(5)
    expect(game.score_for_frame(3)).to eq(17 + 7 + 6)
    expect(game.score).to eq(17 + 7 + 6)
  end

  it 'score perfect game' do
    game = Game.new
    game.throw(10)
    game.throw(0)
    game.throw(10)
    game.throw(0)
    game.throw(10)
    game.throw(0)
    game.throw(10)
    game.throw(0)
    game.throw(10)

    expect(game.score_for_frame(3)).to eq(30 + 30 + 30)
    expect(game.score).to eq(30 + 30 + 30)
  end

  it 'score almost perfect game' do
    game = Game.new
    game.throw(10)
    game.throw(0)
    game.throw(10)
    game.throw(0)
    game.throw(10)
    game.throw(0)
    game.throw(3)
    game.throw(2)

    expect(game.score_for_frame(3)).to eq(30 + 23 + 15)
    expect(game.score).to eq(30 + 23 + 15)
  end

  it 'score first frame spare' do
    game = Game.new
    game.throw(1)
    game.throw(9)
    game.throw(2)
    game.throw(2)
    game.throw(3)
    game.throw(3)

    expect(game.score_for_frame(3)).to eq(12 + 4 + 6)
    expect(game.score).to eq(12 + 4 + 6)
  end

  it 'score last frame spare' do
    game = Game.new
    game.throw(1)
    game.throw(0)
    game.throw(2)
    game.throw(2)
    game.throw(1)
    game.throw(9)
    game.throw(5)

    expect(game.score_for_frame(3)).to eq(1 + 4 + 15)
    expect(game.score).to eq(1 + 4 + 15)
  end
end
