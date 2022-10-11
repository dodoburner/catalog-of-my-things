require_relative '../game'
require 'date'

describe Game do
  before :each do
    @obj = Game.new(true, '2022-10-10', '1998-10-11')
  end
  context 'create an instance of game with game object' do
    it 'takes three parameters and return a Game object' do
      expect(@obj).to be_instance_of Game
    end
  end
  context 'When archiving a game' do
    it 'archives the game' do
      expect(@obj.can_be_archived?).to eq(true)
    end
  end
end
