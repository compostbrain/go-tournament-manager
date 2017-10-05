class AddNumberOfRoundsToTournaments < ActiveRecord::Migration[5.1]
  def change
    add_column :tournaments, :number_of_rounds, :integer
  end
end
