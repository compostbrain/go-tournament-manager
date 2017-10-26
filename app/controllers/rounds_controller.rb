class RoundsController < ApplicationController
  before_action :set_tournament
  before_action :set_round, only: %i(show destroy)

  def show; end

  private

  def set_tournament
    @tournament = Tournament.find(params[:tournament_id])
  end

  def set_round
    @round = Round.find(params[:id])
  end
end
