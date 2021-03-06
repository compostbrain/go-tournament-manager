require "pairing_tool"
class PlayersController < ApplicationController
  def index
    @round = Round.find(params[:round_id])

    @tournament = @round.tournament
    @active_players = @round.players
    @rounds = @tournament.rounds

    @games = @round.games
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to @player, notice: "Added player"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @player.update(player_params)
      redirect_to @player, notice: "Updated player"
    else
      render :edit
    end
  end

  def pair
    @round = Round.find(params[:round_id])
    @tournament = @round.tournament
    @players = @round.players
    pairings = PairingTool.new(
      players: @players, tournament: @tournament, round: @round,
    ).execute
    @games = []
    pairings.each_with_index do |pairing, i|
      @games << if pairing[0].rating > pairing[1].rating
                  Game.create!(
                    round_id: @round.id,
                    white_player_id: pairing[0].id,
                    black_player_id: pairing[1].id,
                    table_number: i + 1,
                  )
                else
                  Game.create!(
                    round_id: @round.id,
                    white_player_id: pairing[1].id,
                    black_player_id: pairing[0].id,
                    table_number: i + 1,
                  )

                end
    end
    redirect_to round_players_path(@round),
       notice: "Game Pairings Created for Round  #{@round.number}"

    # if @games.each(&:save)
    #   redirect_to round_players_url,
    #    notice: "Game Pairings Created for Round  #{@round.number + 1}"
    # else
    #   render :index, notice: "There was an error"
    # end
  end

  private

  def player_params
    params.require(:player).permit(
      :first_name,
      :last_name,
      :rank,
      :aga_number,
      :membership_exp_date,
      :rating,
      :chapter_affiliation,
      :state,
      tournament_registrations_attributes: %i[id status tournament_id],
      round_statuses_attributes: %i[id status round_id],
    )
  end
end
