class PlayersController < ApplicationController
  def index
    @players = Player.order(rating: :desc)
  end
end
