class PlayersController < ApplicationController
  def index
    @tournament = Tournament.last
    @players = Player.order(rating: :desc)
    @rounds = @tournament.rounds
    @round = Round.find(params[:round_id])
    @games = @round.games
  end

  def pair
    @tournament = Tournament.last
    @round = Round.find(params[:round_id])
    @players = Player.all
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
                    table_number: i,
                  )
                else
                  Game.create!(
                    round_id: @round.id,
                    white_player_id: pairing[1].id,
                    black_player_id: pairing[0].id,
                    table_number: i,
                  )

                end
    end
    redirect_to round_players_url,
       notice: "Game Pairings Created for Round  #{@round.number + 1}"

    # if @games.each(&:save)
    #   redirect_to round_players_url,
    #    notice: "Game Pairings Created for Round  #{@round.number + 1}"
    # else
    #   render :index, notice: "There was an error"
    # end
  end
end
