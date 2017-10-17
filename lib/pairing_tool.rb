class PairingTool
  # Group players by rank
  ABOVE_BAR_RATING_BAND = 4
  BAND_TWO = 1
  BAND_THREE = -6
  BAND_FOUR = -12
  BAND_FIVE = -30
  # intial tournament points
  ABOVE_BAR_ITP = 6
  BAND_TWO_ITP = 4
  BAND_THREE_ITP = 3
  BAND_FOUR_ITP = 2
  BAND_FIVE_ITP = 0

  def initialize(players:, tournament:, round:)
    @players = players
    @tournament = tournament
    @round = round
  end

  attr_reader :players, :tournament, :round

  def execute
    # 1. Remove players receiving byes
    # 2. Sort the field
    # 3. Create score groups
    @players.each do |player|
      if @round.number = 1
        player.tournament_points = initial_tournament_points(player)
      else
        player.tournament_points = determine_tournament_points(player)
      end
    end
    # 4. Pair each score group
    Swissper.pair(
      @players,
                  delta_key: :tournament_points,
                  exclude_key: :previous_opponents,
    )
  end

  private

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

  def determine_tournament_points(player)
    player.tournament_points = initial_tournament_points(player)
    games = player.games.joins(
      :tournament,
    ).where(
      tournaments: { id: tournament.id },
    )
    games.each do |game|
      if game.result.winner == player
        player.tournament_points += 1
      end
      if game.result.draw == true
        player.tournament_points += 0.5
      end
    end
  end

  # def determine_previous_opponents(player)
  #   previous_opponents == []
  # end
end
