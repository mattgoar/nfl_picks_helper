class CreateNflResults < ActiveRecord::Migration
  def change
    create_table(:nfl_results) do |t|

      t.integer :week

      t.string :home

      t.string :visitor

      t.string :result

      t.string :eid

      t.string :gsis

      t.string :game_date

      t.string :game_time

      t.timestamps

    end

  end
end
