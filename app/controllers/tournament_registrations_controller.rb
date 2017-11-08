class TournamentRegistrationsController < ApplicationController
<<<<<<< HEAD
  def create
    result = CreateTournamentRegistration.call(
      tournament: tournament,
      player_attributes: player_params,
      round_statuses: params[:round_statuses],
      tournament_registration_status: params[:tournament_registration_status],
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
      tournament_registration_status: params[:tournament_registration_status],
    )

    flash[result.success? ? :notice : :error] = result.message
    redirect_to tournament_path(tournament)
  end

  def tournament
    Tournament.find(params[:tournament_registration][:tournament_id])
=======
  # def create
  #   @tournament = Tournament.find(params[:tournament_id])
  #   @player = Player.find(1)
  #
  #   result = CreatePlayerRegistration.execute(@tournament, @player)
  #
  #   if result.success?
  #     redirect_to ..., notice: result.message
  #   else
  #     # render an error message
  #   end
  # end
  #
  # def update
  #   @tournament = Tournament.find(params[:tournament_id])
  #   @player = Player.find(1)
  #
  #   result = UpdatePlayerRegistration.execute(@tournament, @player)
  #
  #   if result.success?
  #     # redirect_to
  #   else
  #     # render an error message
  #   end
  # end

  def create
    @tournament = Tournament.find(params[:tournament_id])
    @player = Player.where(
      aga_number: params[:player][:aga_number],
    ).
      first_or_initialize(player_params)

    @round_statuses = []

    if @player.save
      @tournament_registration = TournamentRegistration.where(
        player_id: @player.id,
        tournament_id: @tournament.id,
      ).first_or_initialize(status: params[:tournament_registration_status])

      if @tournament_registration.save
        # create player round_statuses
        @tournament.rounds.each do |r|
          rs = r.number.to_s
          @round_statuses << RoundStatus.where(
            player_id: @player.id,
            round_id: r.id,
          ).first_or_initialize(
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
>>>>>>> implemented point_cal class fixes
  end

  def player_params
    params.
      require(:tournament_registration).
      require(:player_attributes).
      permit(:id, :first_name, :last_name, :email, :rank, :aga_number,
              :membership_exp_date, :rating, :chapter_affiliation, :state)
  end
end
