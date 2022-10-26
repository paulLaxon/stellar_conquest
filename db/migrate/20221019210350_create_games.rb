class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :reference
      t.string :winner
      t.integer :points

      t.timestamps
    end
  end
end
