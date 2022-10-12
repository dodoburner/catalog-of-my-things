require_relative('spec_helper')

describe Book do
  before :all do
    @book1 = Book.new('dorian', 'bad', '22-05-2022')
    @book2 = Book.new('jk rowling', 'good', '22-05-2018')
  end

  it 'initializes an instance of the class' do
    expect(@book1).to be_instance_of Book
  end

  it 'sets the archived attribute on initialization' do
    expect(@book1.archived).to eq(true)
    expect(@book2.archived).to eq(false)
  end
end
