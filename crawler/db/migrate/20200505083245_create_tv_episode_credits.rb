class CreateTvEpisodeCredits < ActiveRecord::Migration[6.0]
  def change
    create_table :tv_episode_credits do |t|
		t.belongs_to :tv_episode
		t.belongs_to :person
		t.string :type
		t.string :role
      t.timestamps
    end
  end
end
