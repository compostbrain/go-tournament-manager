class AddAttributesToPlayers < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :phone, :string
    add_column :players, :email, :string
    add_column :players, :zip, :string
  end
end
