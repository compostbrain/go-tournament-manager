require "csv"
class Tournament
  class Import
    include ActiveModel::Model
    attr_accessor :file, :tournament_count, :player_count

    def process!
      tournament_count = 0
      player_count = 0
      # import = WildApricotImport.new
      CSV.foreach(file.path, headers: true) do |row|
        if tournament_count.zero?
          tournament = Tournament.new(
            name: row["Event title"],
            location: row["Event location"],
            begin_date: row["Start date"],
            end_date: row["End date"] || row["Start date"],
            number_of_rounds: 4,
          )
          if tournament.save
          else
            errors.add(
              :base, "Line #{$.} - #{tournament.errors.full_messages.join(',')}"
            )
          end
          tournament_count += 1
        end
        player = Player.where(email: row["Email"]).first_or_initialize
        player.assign_attributes(
          first_name: row["First name"],
          last_name: row["Last name"],
          rank: row["Tournament Entry Rank"] || "XXX",
          aga_number: row["AGA ID"] || "XXXXX",
          membership_exp_date: Date.today,
          rating: 0,
          chapter_affiliation: "XXXX",
          state: "XX",
          phone: row["Phone"],
          zip: row["Zip"],
        )
        if player.save
          player_count += 1
        else
          errors.add(
            :base, "Line #{$.} - #{player.errors.full_messages.join(',')}"
          )
        end
      end
    end

    def save
      process!
      errors.none?
    end
  end
end
