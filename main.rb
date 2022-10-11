require './app'

def main
  app = App.new
  puts 'Welcome to Catalog of my things App!'
  option = display_list
  case option
  when 1
    app.list_all_books
  when 2
    app.list_all_musics
  when 4
    app.list_all_genres
  when 5
    app.list_all_labels
  when 8
    app.add_a_music
  when 9
    app.add_a_book
  end

  main unless option.zero?
end

def display_list
  puts "Please choose an option by entering a number from below:\n"
  puts '1 - List all books'
  puts '2 - List all musics'
  puts '4 - List all genres'
  puts '5 - List all labels'
  puts '8 - Add a music'
  puts '9 - Add a book'
  puts '0 - Exit'
  gets.to_i
end

main
