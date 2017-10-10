class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.integer :result, default: 0

      t.timestamps
    end
  end
end
