class CreateTournamentRegistration
  def self.call(tournament:, player_attributes:, round_statuses:, tournament_registration_status:)
    instance = new(tournament, player_attributes, round_statuses, tournament_registration_status)
    instance.call
  end

  def initialize(tournament, player_attributes, round_statuses, tournament_registration_status)
    @tournament = tournament
    @player_attributes = player_attributes
    @round_statuses = round_statuses
    @tournament_registration_status = tournament_registration_status
  end

  def call
    player = Player.create!(player_attributes)
    create_round_statuses!(player)
    TournamentRegistration.create!(
      player_id: player.id,
      tournament_id: tournament.id,
      status: tournament_registration_status,
    )

    OpenStruct.new(success?: true, player: player, message: "")
  rescue StandardError => e
    OpenStruct.new(success?: true, player: player, message: e.message)
  end

  private

  attr_reader :tournament, :player_attributes, :round_statuses, :tournament_registration_status

  def create_round_statuses!(player)
    tournament.rounds.each do |round|
      round_status = RoundStatus.find_or_initialize_by(player_id: player.id, round_id: round.id)
      round_status.status = (round_statuses || {}).keys.include?(round.number.to_s) ? 1 : 2
      round_status.save!
    end
  end
end
