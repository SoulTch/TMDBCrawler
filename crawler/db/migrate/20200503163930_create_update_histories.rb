class CreateUpdateHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :update_histories do |t|
      t.string :name
      t.timestamps
    end
  end
end
