class WildApricotImport
  def new_tournament(row)
    Tournament.create(
      name: row["Event title"],
      location: row["location"],
      begin_date: row["Start date"],
      end_date: row["End date"],
    )
  end

  def new_player(row)
    Player.create(
      first_name: row["First name"],
      last_name: row["Last name"],
      email: row["Email"],
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
