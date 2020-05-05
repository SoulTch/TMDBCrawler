class Movies < ActiveRecord::Migration[6.0]
  def change
	create_table :users do |t|
		t.Boolean :adult
		t.integer :budget
		 
		t.string :belongs_to_collection
		t.string :homepage

      t. :name
      t.string :email

      t.timestamps
  end
end
