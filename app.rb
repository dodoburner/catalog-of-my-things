require './book'

class App
  def list_all_books
    File.foreach('./books.json') { |b| puts "archived: #{b['archived']}" }
  end

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
      publisher: book.publisher,
      archived: book.archived,
      cover_state: book.cover_state,
      publish_date: book.publish_date,
      author_id: book.author ? book.author.id : nil
    }
    file = File.size('./books.json').zero? ? [] : JSON.parse(File.read('./books.json'))

    file << hash
    File.write('books.json', file.to_json)
  end
end
