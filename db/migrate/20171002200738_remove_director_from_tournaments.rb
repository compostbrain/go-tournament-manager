class RemoveDirectorFromTournaments < ActiveRecord::Migration[5.1]
  def change
    remove_column :tournaments, :director, :string
  end
end
