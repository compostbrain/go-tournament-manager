class WildApricotImport
  attr_accessor :tournament, :player
  def new_tournament(row)
    tournament = Tournament.new(
      name: row["Event title"],
      location: row["Event location"],
      begin_date: row["Start date"],
      end_date: row["End date"],
      number_of_rounds: 4,
    )
  end

  def new_player(row)
    player = Player.where(email: row["Email"]).first_or_initialize
    player.assign_attributes(
      first_name: row["First name"],
      last_name: row["Last name"],
      rank: row["Tournament Entry Rank"] || "",
      aga_number: row["AGA ID"] || "",
      membership_exp_date: Date.today,
      rating: 0,
      chapter_affiliation: "UNKNOWN",
      state: "UNKNOWN",
      phone: row["Phone"],
      zip: row["Zip"],
    )
  end
end
