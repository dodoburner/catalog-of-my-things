require './book'

class App
  def list_all_books; end

  def add_a_book
    print 'Publisher: '
    publisher = gets.chomp
    print 'State of the cover (good or bad): '
    cover_state = gets.chomp
    print 'Publish date: '
    publish_date = gets.chomp

    book = Book.new(publisher, cover_state, publish_date)
    hash = {
      id: book.id,
      archived: book.archived,
      cover_state: book.cover_state,
      publish_date: book.publish_date,
      author_id: book.author ? book.author.id : nil
    }
    File.write('books.json', hash.to_json, mode: 'a')
  end
end
