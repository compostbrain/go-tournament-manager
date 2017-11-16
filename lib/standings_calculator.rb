# calculate current standings for tournaments
# use one of four methods:
  # SOMS: Sum of McMahon Scores for all opponents
  # SODOMS: The sum of defeated Opponents McMahon Scores
  # Face to face result (if applicable)
  # Random draw

require "points_calculator"
class StandingsCalculator

  attr_reader :players, :tournament # :calculation_method

  def initialize(players:, tournament:)
    @tournament = tournament
    @players = players
    # @calculation_method = calculation_method
  end

  def execute
    players.each do |player|
      PointsCalculator.new(
        player: player,
        tournament: tournament,
      ).determine_tournament_points(player, tournament)
    end

    sorted_players = players.sort_by(&:tournament_points).reverse!

    sorted_players
  end

  private

  def determine_previous_opponents(player)
    player.previous_opponents = []
    games = player.games.joins(
      :tournament,
    ).where(
      tournaments: { id: tournament.id },
    )
    games.each do |game|
      if game.white_player != player
        player.previous_opponents << game.white_player
      elsif game.black_player != player
        player.previous_opponents << game.black_player
      end
    end
  end

  def determine_defeated_opponents(player)
    player.defeated_opponents = []
    games = player.games.joins(
      :tournament,
    ).where(
      tournaments: { id: tournament.id },
    )
    games.each do |game|
      if game.result.winner == player
        player.defeated_opponents << game.player
      elsif game.black_player != player
        player.defeated_opponents << game.black_player
      end
    end
  end

end
