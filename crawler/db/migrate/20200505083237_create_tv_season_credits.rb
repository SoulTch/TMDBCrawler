class CreateTvSeasonCredits < ActiveRecord::Migration[6.0]
  def change
    create_table :tv_season_credits do |t|
      t.belongs_to :tv_season
      t.belongs_to :person
      t.string :type
      t.string :role
      t.timestamps
    end
  end
end
