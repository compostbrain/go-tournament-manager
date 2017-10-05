class AddUsersToTournaments < ActiveRecord::Migration[5.1]
  def change
    add_reference :tournaments, :user, foreign_key: true
  end
end
