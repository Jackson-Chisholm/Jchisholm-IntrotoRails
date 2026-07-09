class CreatePeople < ActiveRecord::Migration[8.1]
  def change
    create_table :people do |t|
      t.string :name
      t.date :said_at

      t.timestamps
    end
  end
end
