class PlayersController < ApplicationController
  def index
    @tournament = Tournament.last
    @players = Player.order(rating: :desc)
    @rounds = @tournament.rounds
    @round = Round.find(params[:round_id])
    @games = @round.games
  end

  def pair
    # players = Player.where(id: params[:tournament][:player_ids])
    # TODO change players assignment to active players with
    # tournament_registration status if final and round_statuse of active
    @round = Round.find(params[:round_id])
    @players = Player.all
    pairings = PairingTool.new(
      players: @players, tournament: @tournament, round: @round,
    ).execute
    @games = []
    pairings.each_with_index do |pairing, i|
      @games << if pairing[0].rating > pairing[1].rating
                  Game.new(
                    round_id: @round.id,
                    white_player_id: pairing[0],
                    black_player_id: pariing[1],
                    table_number: i,
                  )
                else
                  Game.new(
                    round_id: @round.id,
                    white_player_id: pairing[1],
                    black_player_id: pariing[0],
                    table_number: i,
                  )

                end
    end
    if @games.each(&:save)
      redirect_to round_players,
       notice: "Game Pairings Created for Round  #{@round.number}"
    else
      render :index, notice: "There was an error"
    end
  end
end
