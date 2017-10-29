require "wild_apricot_import"
namespace :import do
  desc "create a new tournament and import players from WildApricot"
  task players: :environment do
    filename = File.join Rails.root, "players.csv"
    counter = 0
    import = WildApricotImport.new
    CSV.foreach(filename, headers: true) do |row|
      if counter == 1
        import.new_tournament(row)
      end
      import.new_player(row)
      counter += 1
    end
    puts "Imported #{counter} players"
  end
end
