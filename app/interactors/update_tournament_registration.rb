class UpdateTournamentRegistration
  def self.call(
    tournament:,
    tournament_registration:,
    player_attributes:,
    round_statuses:,
    tournament_registration_status:
  )
    instance = new(
      tournament,
      tournament_registration,
      player_attributes,
      round_statuses,
      tournament_registration_status,
    )
    instance.call
  end

  def initialize(
    tournament,
    tournament_registration,
    player_attributes,
    round_statuses,
    tournament_registration_status
  )
    @tournament = tournament
    @tournament_registration = tournament_registration
    @player_attributes = player_attributes
    @player = Player.find(player_attributes[:id])
    @round_statuses = round_statuses
    @tournament_registration_status = tournament_registration_status
  end

  def call
    player.update!(player_attributes)
    create_round_statuses!
    tournament_registration.update!(status: tournament_registration_status)

    OpenStruct.new(success?: true, player: player, message: "")
  rescue StandardError => e
    OpenStruct.new(success?: false, player: player, message: e.message)
  end

  private

  attr_reader :tournament,
              :tournament_registration,
              :player_attributes,
              :player,
              :round_statuses,
              :tournament_registration_status

  def create_round_statuses!
    tournament.rounds.each do |round|
      round_status = RoundStatus.find_or_initialize_by(
        player_id: player.id, round_id: round.id,
      )
      round_status.status =
        (round_statuses || {}).keys.include?(round.number.to_s) ? 1 : 2
      round_status.save!
    end
  end
end
