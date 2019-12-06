class CreateJokes < ActiveRecord::Migration[5.1]
  def change
    create_table :jokes do |t|
      t.string :topic
      t.text :body
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
