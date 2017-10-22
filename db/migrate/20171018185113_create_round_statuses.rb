class CreateRoundStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :round_statuses do |t|
      t.references :player, foreign_key: true
      t.references :round, foreign_key: true
      t.integer :status, default: 1

      t.timestamps
    end
  end
end
