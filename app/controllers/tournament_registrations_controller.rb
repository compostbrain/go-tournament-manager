class TournamentRegistrationsController < ApplicationController
  def create
    result = CreateTournamentRegistration.call(
      tournament: tournament,
      player_attributes: player_params,
      round_statuses: params[:round_statuses],
      tournament_registration_status: params[:tournament_registration_status]
    )

    flash[result.success? ? :notice : :error] = result.message
    redirect_to tournament_path(tournament)
  end

  def update
    tournament_registration = TournamentRegistration.find(params[:id])
    result = UpdateTournamentRegistration.call(
      tournament: tournament,
      tournament_registration: tournament_registration,
      player_attributes: player_params,
      round_statuses: params[:round_statuses],
      tournament_registration_status: params[:tournament_registration_status]
    )

    flash[result.success? ? :notice : :error] = result.message
    redirect_to tournament_path(tournament, player_id: result.player.id)
  end

  def tournament
    Tournament.find(params[:tournament_registration][:tournament_id])   
  end

  def player_params
    params
      .require(:tournament_registration)
      .require(:player_attributes)
      .permit(:id, :first_name, :last_name, :email, :rank, :aga_number,
              :membership_exp_date, :rating, :chapter_affiliation, :state)
  end
end
