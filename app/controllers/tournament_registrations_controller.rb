class TournamentRegistrationsController < ApplicationController
  def create
    @tournament = Tournament.find(params[:tournament_id])
    @player = Player.new(player_params)

    if @player.save
      @tournament_registration = TournamentRegistration.new(
        player_id: @player.id,
        tournament_id: @tournament.id,
      )
      if @tournament_registration.save
        redirect_to tournaments_path(id: @tournament.id),
        notice: "Registered player"
      else
        redirect_to tournament_path(id: @tournament.id),
        notice: "Registration failed"
      end
    else
      redirect_to tournament_path(id: @tournament.id),
      notice: "Registration failed"
    end
  end

  private

  def player_params
    params.require(:player).permit(:first_name, :last_name, :rank, :aga_number,
    :membership_exp_date, :rating, :chapter_affiliation, :state)
  end
end
