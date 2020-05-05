class CreateTvSeasons < ActiveRecord::Migration[6.0]
  def change
    create_table :tv_seasons, id: false do |t|
      t.primary_key :id
      t.belongs_to :tv
      t.string :name
      t.integer :season_number

      t.timestamps
    end
  end
end
