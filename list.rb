class AppList
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
  # ======== list all authors ==========

  def list_all_authors
    authors = File.size('./author.json').zero? ? [] : JSON.parse(File.read('./author.json'))
    authors.each do |a|
      puts "First Name: #{a['first_name']} , Last Name: #{a['last_name']}"
    end
  end
end
