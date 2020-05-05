class CreateMovieCredits < ActiveRecord::Migration[6.0]
  def change
    create_table :movie_credits do |t|
	  t.belongs_to :movie
	  t.belongs_to :person
	  t.string :role
	  t.string :type
      t.timestamps
    end
  end
end
