class CreateMovies < ActiveRecord::Migration[6.0]
  def change
  create_table :movies, id: false do |t|
      t.primary_key :id
      t.string :release_date
      t.string :title

      t.timestamps
    end
  end
end
