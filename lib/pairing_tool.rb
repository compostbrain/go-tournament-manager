require "points_calculator"
class PairingTool

  attr_reader :players, :tournament, :round
  def initialize(players:, tournament:, round:)
    @players = players
    @tournament = tournament
    @round = round
  end

  def execute
    # active_players = remove_bye_players(players, round)

    sorted_players = players.sort_by(&:rating)
    sorted_players.each do |player|
      PointsCalculator.new(
        player: player,
        tournament: tournament,
      ).determine_tournament_points(player, tournament)
      determine_previous_opponents(player)
    end

    Swissper.pair(
      sorted_players, delta_key: :tournament_points,
                      exclude_key: :previous_opponents
    )
  end

  private

  # extracted to points_calculator class
  # def initial_tournament_points(player)
  #   player.tournament_points = 0
  #   if player.rating >= ABOVE_BAR_RATING_BAND
  #     player.tournament_points = ABOVE_BAR_ITP
  #   elsif player.rating >= BAND_TWO
  #     player.tournament_points = BAND_TWO_ITP
  #   elsif player.rating >= BAND_THREE
  #     player.tournament_points = BAND_THREE_ITP
  #   elsif player.rating >= BAND_FOUR
  #     player.tournament_points = BAND_FOUR_ITP
  #   elsif player.rating >= BAND_FIVE
  #     player.tournament_points = BAND_FIVE_ITP
  #   end
  # end
  #
  # def determine_tournament_points(player)
  #   player.tournament_points = initial_tournament_points(player)
  #   games = player.games.joins(
  #     :tournament,
  #   ).where(
  #     tournaments: { id: tournament.id },
  #   )
  #   games.each do |game|
  #     if game.result.winner == player
  #       player.tournament_points += 1
  #     end
  #     if game.result.draw == true
  #       player.tournament_points += 0.5
  #     end
  #   end
  # end

  def determine_previous_opponents(player)
    player.previous_opponents = []
    games = player.games.joins(
      :tournament,
    ).where(
      tournaments: { id: tournament.id },
    )
    if games
      games.each do |game|
        if game.white_player != player
          player.previous_opponents << game.white_player
        elsif game.black_player != player
          player.previous_opponents << game.black_player
        end
      end
    end
  end

  # this method removes players who received voluntary bye
  # for the round being paired

  def remove_bye_players(players, round)
    Player.joins(
      :round_statuses,
    ).where(
      round_statuses: { status: 1, round_id: round.id },
    ).where(id: players.map(&:id))
  end
end
