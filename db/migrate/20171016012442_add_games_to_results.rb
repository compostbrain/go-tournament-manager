class AddGamesToResults < ActiveRecord::Migration[5.1]
  def change
    add_reference :results, :game, foreign_key: true
  end
end
