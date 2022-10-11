require_relative '../game'
require 'date'

describe Game do
  before :each do
    @game = Game.new(true, '2022-10-10', '1998-10-11')
  end
  context 'create an instance of game with game object' do
    it 'takes three parameters and return a Game object' do
      expect(@game).to be_instance_of Game
    end
  end
  context 'When archiving a game' do
    it 'archives the game' do
      expect(@game.can_be_archived?).to eq(true)
    end
  end
end
