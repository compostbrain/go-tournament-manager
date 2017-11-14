class GamesController < ApplicationController
  def index
    @round = Round.find(params[:round_id])
    @games = @round.games
  end

  def update
    if game.result.update!(result_params)
      redirect_to round_games_path(game.round), notice: "Game Result Saved"
    else
      render round_games_path(game.round), notice: "Error saving game result. Please retry."
    end
  end

  private

  def game
    Game.find(params[:game][:game_id])
  end

  def result_params
    params.
      require(:game).
      require(:result_attributes).
      permit(:outcome, :id)
  end
end
