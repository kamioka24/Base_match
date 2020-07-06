class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.integer :player_id
      t.string :name
      t.string :school
      t.integer :year
      t.string :address
      t.string :phone_number
      t.integer :choice
      t.date :day
      t.text :question

      t.timestamps
    end
  end
end
