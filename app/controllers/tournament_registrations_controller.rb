class TournamentRegistrationsController < ApplicationController
  def create
    @tournament = Tournament.find(params[:tournament_id])
    @player = Player.new(player_params)
    @tournament_registration = TournamentRegistration.new(
      player_id: @player.id,
      tournament_id: @tournament.id,
    )
    if @player.save && @tournament_registration.save
      redirect_to tournament_path, notice: "Registered player"
    else
      redirect_to tournament_path, notice: "Registration failed"
    end
  end

  private

  def player_params
    params.require(:player).permit(:first_name, :last_name, :rank, :aga_number,
    :membership_exp_date, :rating, :chapter_affiliation, :state)
  end
end
