class TournamentDirector < User


  def full_name
    first_name.upcase + " " + last_name.upcase
  end
end
