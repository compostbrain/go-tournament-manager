class PairingTool
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
    if @round.number = 1
      initial_tournament_points(players)
    else
      @players.each do |player|
        determine_tournament_points(player)
      end
    end
    # 4. Pair each score group
    Swissper.pair(@players, delta_key: :tournament_points)
  end

  private

  def initial_tournament_points(players)
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

    players.each do |player|
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

  def determine_tournament_points(player, round)
    # check to see the result of the round before
    # if they won add one point
    # if they lost do nothing
    # if they had a bye add .5?
  end
end

PairingTool.new(...).execute