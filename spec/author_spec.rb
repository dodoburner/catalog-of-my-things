require_relative '../game'
require_relative '../author'

describe Author do
before :all do
@game = Game.new(true, '2022-10-10','1998-10-11')
@author = Author.new('Alfred', 'Kinyua', '2022-10-10')
end
context 'create instance of class Author' do
it 'takes three parameters and return a Label object' do
expect(@author).to be_instance_of Author
end
end
context 'When retrieving the first name of an author' do
    it 'returns the correct first name' do
    expected_value = 'Alfred'
    expect(@author.first_name).to eq(expected_value)
    end
    end
    context 'When adding a game into an author' do
    it 'adds the game into a specific author' do
    @author.add_author(@game)
    expect(@author.items).to include(@game)
    expect(@author.items.length).to eq(1)
    end
    end
    end
    