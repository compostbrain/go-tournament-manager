
namespace :import do
  desc "create a new tournament and import players from csv"
  task players: :environment do
    filename = File.join Rails.root, "players.csv"
    counter = 0
    CSV.foreach(filename, headers: true) do |row|

      if counter == 0
        Tournament.create(
                          name: row["Event title"],
                          location: row["location"],
                          begin_date: row["Start date"],
                          end_date: row["End date"],
                        )
      end
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
      counter += 1
    end
    puts "Imported #{counter} players"
  end

end
