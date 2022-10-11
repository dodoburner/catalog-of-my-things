require './item'

class Author < Item
  attr_accessor :first_name, :last_name, :items
  attr_reader :id

  def initialize(first_name, last_name, publish_date)
    super(publish_date)
    @id = Random.rand(0..1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_author(book)
    @items << (book)
    book.author = self
  end
end
