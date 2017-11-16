require "standings_calculator"
class StandingsController < ApplicationController
  def index
    @tournament = Tournament.find(params[:tournament_id])
    t_players = Player.with_final_registration_statuses(@tournament)
    @players = StandingsCalculator.new(players: t_players, tournament: @tournament).execute
  end

end
