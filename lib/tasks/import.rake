require "wild_apricot_import"
namespace :import do
  desc "create a new tournament and import players from WildApricot"
  task tournament: :environment do
    filename = File.join Rails.root, "players.csv"
    tournament_counter = 0
    player_counter = 0
    import = WildApricotImport.new
    CSV.foreach(filename, headers: true) do |row|
      if tournament_counter.zero?
        import.new_tournament(row)
        if @tournament.save
          tournament_counter += 1
        else
          puts
          "#{tournament.name} - #{tournament.errors.full_messages.join(',')}"
        end
      end
      import.new_player(row)
      if @player.save
        player_counter += 1
      else
        puts "#{player.email} - #{player.errors.full_messages.join(',')}"
      end
    end
  end
end
