require 'game'

describe Game do
 it 'score no strikes & spares' do
    game = Game.new
    game.throw(2)
    game.throw(7)
    game.throw(1)
    game.throw(5)
    expect(game.score_for_frame(2)).to eq(15)
    expect(game.current_frame).to eq(3)
 end 

 it 'score first frame spare' do
    game = Game.new
    game.throw(2)
    game.throw(8)
    game.throw(1)
    game.throw(5)
    expect(game.score_for_frame(2)).to eq(17)
    expect(game.current_frame).to eq(3)
 end 
end
