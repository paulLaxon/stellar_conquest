class GamesController < ApplicationController
  before_action :get_board
  def game
    @game = Game.new
  end

  def board
    @game = Game.new
    # if game.save
      @board = @game.initialize_game
    # else
    #   render 'game'
    # end
  end

  def index
  end

  def game_sheet
    @colonies = @game_user.colonies
  end

  def max_factories(max_pop)
    max = max_pop
    # return Float::INFINITY if robotic research
    # return 2 x max_pop if adv industry research
    max_pop
  end

  private

  def get_board
    @board = game.initialize_board
  end
  # def game_params
  #   params.require(:game).permit(:reference, :winner, :points)
  # end
end
