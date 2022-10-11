require 'json'
require './book'
require './label'
require './music'
require './genre'

class App
  # ======== Add labels ==========
  def add_label(item)
    print 'Label title: '
    title = gets.chomp
    print 'Label color: '
    color = gets.chomp
    label = Label.new(title, color)
    label.add_item(item)
    store_label(label)
  end

  # ======== store labels ==========

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

  # ======== Add books ==========

  def add_a_book
    print 'Publisher: '
    publisher = gets.chomp
    print 'State of the cover (good or bad): '
    cover_state = gets.chomp
    print 'Publish date: '
    publish_date = gets.chomp
    book = Book.new(publisher, cover_state, publish_date)
    add_label(book)
    puts 'Book and label were added successfully!'
    store_book(book)
  end

  # ======== store books ==========

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

  # ======== list all books ==========

  def list_all_books
    books = File.size('./books.json').zero? ? [] : JSON.parse(File.read('./books.json'))
    books.each do |b|
      puts "Publisher: #{b['publisher']}, Cover State: #{b['cover_state']}, Publish Date: #{b['publish_date']}"
    end
  end

  # ======== list all labels ==========

  def list_all_labels
    labels = File.size('./labels.json').zero? ? [] : JSON.parse(File.read('./labels.json'))
    labels.each do |l|
      puts "Title: #{l['title']}, Color: #{l['color']}"
    end
  end

  # ======== Add genre ==========

  def add_genre(item)
    print 'Genre name: '
    name = gets.chomp

    genre = Genre.new(name)
    genre.add_item(item)
    store_genre(genre)
  end

  # ======== store genre ==========

  def store_genre(genre)
    hash = {
      id: genre.id,
      name: genre.name
    }

    file = File.size('./genres.json').zero? ? [] : JSON.parse(File.read('./genres.json'))
    file << hash
    File.write('genres.json', file.to_json)
  end

  # ======== Add music ==========
  def add_a_music
    print 'On Spotify (true or false): '
    on_spotify = gets.chomp
    print 'Publish date: '
    publish_date = gets.chomp
    music = Music.new(on_spotify, publish_date)
    add_genre(music)
    puts 'Music and Genre were added successfully!'
    store_music(music)
  end

  # ======== store music ==========

  def store_music(music)
    hash = {
      id: music.id,
      on_spotify: music.on_spotify,
      genre_id: music.genre.id
    }

    file = File.size('./musics.json').zero? ? [] : JSON.parse(File.read('./musics.json'))
    file << hash
    File.write('musics.json', file.to_json)
  end

  # ======== list all genre ==========

  def list_all_genres
    genres = File.size('./genres.json').zero? ? [] : JSON.parse(File.read('./genres.json'))
    genres.each do |g|
      puts "Name: #{g['name']}"
    end
  end

  # ======== list all music ==========

  def list_all_musics
    musics = File.size('./musics.json').zero? ? [] : JSON.parse(File.read('./musics.json'))
    musics.each do |m|
      puts "On Spotify: #{m['on_spotify']}"
    end
  end
end
