class CreateShows < ActiveRecord::Migration[5.1]
  def change
    create_table :shows do |t|
      t.datetime :date
      t.string :name
      t.timestamps
      t.references :user, foreign_key: true
      t.references :club, foreign_key: true
    end
  end
end
