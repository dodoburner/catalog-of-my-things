class Main
  def initialize
  end

  def list_holder(option)
    case option
    when 
      list_all_books
    when 2
      list_all_music_album
    when 3
      list_all_games
    when 4
      list_all_genres
    when 5
      list_all_labels
    when 6
      list_all_authors
    when 7
      list_all_sources
    when 8
      add_book
    when 9
      add_music
    when 10
      add_games
    end
  end

  def display_list
    puts "Please choose an option by entering a number from below:\n"
    puts '1 - List all books'
    puts '2 - List all music albums'
    puts '3 - List of games'
    puts '4 - List all genres (Comedy or Thriller)'
    puts '5 - List all labels (Gift or New Gift)'
    puts '6 - List all authors'
    puts '7 - List all sources (From a friend or Online shop)'
    puts '8 - Add a book'
    puts '9 - Add a music album'
    puts '10 - Add a game'
    puts '0 - Exit'
  end
end