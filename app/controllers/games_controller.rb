class GamesController < ApplicationController
  def index
    @round = Round.find(params[:round_id])
    @games = @round.games
  end
end
