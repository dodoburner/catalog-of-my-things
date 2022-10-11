require './book'
require './label'

class App
  def add_label(item)
    print 'Label title: '
    title = gets.chomp
    print 'Label color: '
    color = gets.chomp

    label = Label.new(title, color)
    label.add_item(item)
    store_label(label)
  end

  def store_label(label)
    hash = {
      id: label.id,
      title: label.title,
      color: label.color
    }

    file = File.size('./labels.json').zero? ? [] : JSON.parse(File.read('./labels.json'))
    file << hash
    File.write('labels.json', file.to_json)
  end

  def add_a_book
    print 'Publisher: '
    publisher = gets.chomp
    print 'State of the cover (good or bad): '
    cover_state = gets.chomp
    print 'Publish date: '
    publish_date = gets.chomp

    book = Book.new(publisher, cover_state, publish_date)
    add_label(book)
    store_book(book)
  end

  def store_book(book)
    hash = {
      id: book.id,
      publisher: book.publisher,
      archived: book.archived,
      cover_state: book.cover_state,
      publish_date: book.publish_date,
      label_id: book.label.id
    }

    file = File.size('./books.json').zero? ? [] : JSON.parse(File.read('./books.json'))
    file << hash
    File.write('books.json', file.to_json)
  end

  def list_all_books
    books = File.size('./books.json').zero? ? [] : JSON.parse(File.read('./books.json'))
    books.each do |b|
      puts "Publisher: #{b['publisher']}, Cover State: #{b['cover_state']}, Publish Date: #{b['publish_date']}"
    end
  end

  def list_all_labels
    labels = File.size('./labels.json').zero? ? [] : JSON.parse(File.read('./labels.json'))
    labels.each do |l|
      puts "Title: #{l['title']}, Color: #{l['color']}"
    end
  end
end
