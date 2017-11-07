module ApplicationHelper
  def list_of_tournament_names
    tournaments = Tournament.all
    tournament_names = []
    tournaments.each do |tournament|
      tournament_names << tournament.name
    end
    tournament_names
  end

  def registration_status(tournament, player)
    TournamentRegistration.find_by(
      tournament_id: tournament.id, player_id: player.id,
    ).status
  end

  def round_participation_status(round, player)
    RoundStatus.find_by(round_id: round.id, player_id: player.id).status
  end

  def checked_in_players(tournament)
    all_players = Player.all
    players = Player.joins(
      :tournament_registrations,
    ).where(
      tournament_registrations: { tournament_id: tournament.id },
    ).where(id: all_players.map(&:id))
    players
  end
  # def active_players(round)
  #   players = registered_players(round.tournament)
  #   active_players = players.joins(
  #     round_statuses,
  #   ).where(
  #     round_statuses: { round_id: round.id },
  #   ).where(id: )
  # end
end
