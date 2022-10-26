require 'csv'

class Game < ApplicationRecord
  def initialize_game
    @board = initialize_board
    # @players = initialize_players
  end

  def initialize_board(length = 32, width = 21)
    stars = initialize_stars
    clouds = initialize_clouds.flatten
    board = {}

    stars.each_value do |star|
      loc = star['location']
      board[loc] = { name: star['name'], colour: star['colour'], cloud: false }
    end

    clouds.each do |location|
      if board[location].nil?
        board[location] = { name: '', colour: '', cloud: true }
      else
        board[location][:cloud] = true
      end
    end

    board
  end

  def initialize_players(game_users)
  end

  def initialize_stars
    planets = import_csv_table('\Planets.csv', true)
    stars = import_csv_table('\Stars.csv', true)

    num_cards = planets['card'].max
    cards = (1..num_cards).to_a.shuffle
    # assign planet card to star, checking on colour
    game_stars = {}
    i = 0
    while i < num_cards
      colour = planets.find { |row| row['card'] == cards[i] }['colour']
      star_index = stars.find_index { |row| row['colour'] == colour }
      unless star_index.nil? # skip card if no stars remain with that colour
        game_stars[cards[i]] = stars[star_index].to_h
        stars.delete(star_index)
      end
      i += 1
    end
    game_stars
  end

  def initialize_clouds
    import_csv_table('\Clouds.csv', false)
  end

  private

  def import_csv_table(filename, header)
    directory = 'public'
    filename =  directory.concat(filename)
    csv_text = File.read(filename)
    CSV.parse(csv_text, headers: header, converters: :integer)
  end
end
