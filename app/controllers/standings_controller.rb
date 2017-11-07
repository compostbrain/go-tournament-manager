class StandingsController < ApplicationController
  def index
    @tournament = Tournament.find(params[:tournament_id])
    @players = Player.with_final_registration_statuses(@tournament)
  end
end
