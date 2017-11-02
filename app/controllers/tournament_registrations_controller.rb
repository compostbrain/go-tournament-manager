class TournamentRegistrationsController < ApplicationController
  def create
    @tournament = Tournament.find(params[:tournament_id])
    @player = Player.new(player_params)

    @round_statuses = []

    if @player.save
      @tournament_registration = TournamentRegistration.new(
        player_id: @player.id,
        tournament_id: @tournament.id,
        status: params[:tournament_registration_status],
      )

      if @tournament_registration.save
        # create player round_statuses
        @tournament.rounds.each do |r|
          rs = r.number.to_s
          @round_statuses << RoundStatus.new(
            player_id: @player.id,
            round_id: r.id,
            status: if params[:round_statuses].include?(rs)
                      1 # enum status: { active: 1, bye: 2 }
                    else
                      2
                    end,
          )
        end

        if @round_statuses.each(&:save)

          redirect_to tournament_path(id: @tournament.id),
          notice: "Registered player"
        else
          redirect_to tournament_path(id: @tournament.id),
          notice: "Registration failed"
        end
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
