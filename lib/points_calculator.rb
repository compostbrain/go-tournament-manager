class PointsCalculator
  # Set bands based on player ratings
  ABOVE_BAR_RATING_BAND = 4
  BAND_TWO = 1
  BAND_THREE = -6
  BAND_FOUR = -12
  BAND_FIVE = -30
  # initial tournament points
  ABOVE_BAR_ITP = 6
  BAND_TWO_ITP = 4
  BAND_THREE_ITP = 3
  BAND_FOUR_ITP = 2
  BAND_FIVE_ITP = 0

  attr_reader :players, :tournament

  def initialize(player:, tournament:)
    @player = player
    @tournament = tournament
  end

<<<<<<< HEAD
=======

>>>>>>> 5eb93fb4fef4b2c5b6ceec4930dbc4c8034d47dc
  def determine_tournament_points(player, tournament)
    player.tournament_points = initial_tournament_points(player)
    games = gather_games(player)
    games.each do |game|
      if game.result.winner == player
        player.tournament_points += 1
      end
      if game.result.draw == true
        player.tournament_points += 0.5
      end
    end
  end

  private

  def gather_games(player)
    player.games.joins(
      :tournament,
    ).where(
      tournaments: { id: tournament.id },
    )
  end

  def initial_tournament_points(player)
    player.tournament_points = 0
    if player.rating >= ABOVE_BAR_RATING_BAND
      player.tournament_points = ABOVE_BAR_ITP
    elsif player.rating >= BAND_TWO
      player.tournament_points = BAND_TWO_ITP
    elsif player.rating >= BAND_THREE
      player.tournament_points = BAND_THREE_ITP
    elsif player.rating >= BAND_FOUR
      player.tournament_points = BAND_FOUR_ITP
    elsif player.rating >= BAND_FIVE
      player.tournament_points = BAND_FIVE_ITP
    end
  end
end
