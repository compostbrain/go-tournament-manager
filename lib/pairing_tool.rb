require "points_calculator"
class PairingTool
<<<<<<< HEAD
=======
<<<<<<< HEAD
  # Group players by rank
  ABOVE_BAR_RATING_BAND = 4
  BAND_TWO = 1
  BAND_THREE = -6
  BAND_FOUR = -12
  BAND_FIVE = -31
  # initial tournament points
  ABOVE_BAR_ITP = 6
  BAND_TWO_ITP = 4
  BAND_THREE_ITP = 3
  BAND_FOUR_ITP = 2
  BAND_FIVE_ITP = 0
=======
>>>>>>> implemented point_calculator class

>>>>>>> implemented point_calculator class
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
<<<<<<< HEAD
      PointsCalculator.new(
        player: player,
        tournament: tournament,
      ).determine_tournament_points(player, tournament)
=======
      PointsCalculator.determine_tournament_points(player)
>>>>>>> implemented point_calculator class
      determine_previous_opponents(player)
    end

    Swissper.pair(
      sorted_players, delta_key: :tournament_points,
                      exclude_key: :previous_opponents
    )
  end

  private
<<<<<<< HEAD

=======
>>>>>>> implemented point_calculator class
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
    games.each do |game|
      if game.white_player != player
        player.previous_opponents << game.white_player
      elsif game.black_player != player
        player.previous_opponents << game.black_player
      end
    end
  end

  def remove_bye_players(players, round)
    Player.joins(
      :round_statuses,
    ).where(
      round_statuses: { status: 1, round_id: round.id },
    ).where(id: players.map(&:id))
  end
end
