require_relative('spec_helper')
require 'date'

describe('Music') do
  it('should initialize a music') do
    music = Music.new(nil, on_spotify: true, publish_date: '2018-01-01', genre: Genre.new(name: 'Rock'))
    expect(music.on_spotify).to(eq(true))
    expect(music.publish_date).to(eq(Date.parse('2018-01-01')))
    expect(music.genre.name).to(eq('Rock'))
  end
end
