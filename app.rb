require 'json'
require './book'
require './label'
require './music'
require './genre'
require './game'
require './author'
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

  # ======== Add games ==========
  def add_game
    print 'Is it multiplayer [Y / N]'
    multiplayer = gets.chomp.downcase == 'y'
    print 'Last played date, use  (YYYY-MM-DD) format: '
    last_played_at_date = gets.chomp
    print 'publish_date use  (YYYY-MM-DD) format: '
    publish_date = gets.chomp
    new_game = Game.new(multiplayer, last_played_at_date, publish_date)
    add_author(new_game)
    puts 'Game and Author were added successfully!'
    store_game(new_game)
  end

  # ======== store games ==========
  def store_game(new_game)
    hash = {
      id: new_game.id,
      multiplayer: new_game.multiplayer,
      archived: new_game.archived,
      author_id: new_game.author.id,
      last_played_at_date: new_game.last_played_at_date,
      publish_date: new_game.publish_date
    }
    file = File.size('./games.json').zero? ? [] : JSON.parse(File.read('./games.json'))
    file << hash
    File.write('games.json', file.to_json)
  end

  # ======== Add author ==========
  def add_author(item)
    puts 'Enter first name'
    first_name = gets.chomp
    puts 'Enter last name'
    last_name = gets.chomp
    new_author = Author.new(first_name, last_name)
    new_author.add_item(item)
    store_author(new_author)
  end

  # ======== Store author  ==========
  def store_author(new_author)
    hash = {
      id: new_author.id,
      first_name: new_author.first_name,
      last_name: new_author.last_name,
    }

    file = File.size('./author.json').zero? ? [] : JSON.parse(File.read('./author.json'))
    file << hash
    File.write('author.json', file.to_json)
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
      archived: music.archived,
      genre_id: music.genre.id,
      publish_date: music.publish_date
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
      puts "On Spotify: #{m['on_spotify']}, Publish Date: #{m['publish_date']}"
    end
  end
  # ======== list all games ==========

  def list_all_games
    games = File.size('./games.json').zero? ? [] : JSON.parse(File.read('./games.json'))
    games.each do |g|
      puts "Multiplayer: #{g['multiplayer']} , Last Played At Date: #{g['last_played_at_date']}"
    end
  end

  def list_all_authors
    authors = File.size('./author.json').zero? ? [] : JSON.parse(File.read('./author.json'))
    authors.each do |a|
      puts "First Name: #{a['first_name']} , Last Name: #{a['last_name']}"
    end
  end
end
