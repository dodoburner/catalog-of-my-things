require_relative '../game'
require_relative '../author'

describe Author do
before :all do
@obj = Game.new(true, '2022-10-10','1998-10-11')
@author = Author.new('Alfred', 'Kinyua', '2022-10-10')
end
context 'create instance of class Author' do
it 'takes three parameters and return a Label object' do
expect(@author).to be_instance_of Author
end
end
end