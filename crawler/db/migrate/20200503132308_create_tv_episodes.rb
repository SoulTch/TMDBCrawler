class CreateTvEpisodes < ActiveRecord::Migration[6.0]
  def change
    create_table :tv_episodes, id: false do |t|
	  t.primary_key :id
	  t.string :name
	  t.belongs_to :tv_season
	  t.belongs_to :tv
	  t.integer :episode_number
	  t.integer :season_number
      t.timestamps
    end
  end
end
