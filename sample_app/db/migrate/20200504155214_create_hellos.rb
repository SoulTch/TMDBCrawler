class CreateHellos < ActiveRecord::Migration[6.0]
  def change
    create_table :hellos do |t|
      t.belongs_to :ss, null: false, foreign_key: true

      t.timestamps
    end
  end
end
