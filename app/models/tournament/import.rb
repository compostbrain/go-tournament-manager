class Tournament
  class Import
    include ActiveModel::Model
    attr_accessor :file, :tournament_count, :player_count

    def process!
      @tournament_count = 0
      @player_count = 0
      import = WildApricotImport.new
      CSV.foreach(filename, headers: true) do |row|
        if tournament_counter.zero?
          import.new_tournament(row)
          if @tournament.save
            @tournament_count += 1
          else
            errors.add(
              :base, "Line #{$.} - #{tournament.errors.full_messages.join(',')}"
            )
          end
        end
        import.new_player(row)
        if @player.save
          @player_count += 1
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
