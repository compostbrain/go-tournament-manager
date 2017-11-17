class ResultsController < ApplicationController
  def update
    if result.update!(result_params)
      redirect_to round_games_path(result.game.round),
      notice: "Game Result Saved"
    else
      render round_games_path(result.game.round),
      notice: "Error saving game result. Please retry."
    end
  end

  private

  def result
    Result.find(params[:id])
  end

  def result_params
    params.require(:result).permit(:outcome, :id)
  end
end
