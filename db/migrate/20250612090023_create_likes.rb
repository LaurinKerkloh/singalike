class CreateLikes < ActiveRecord::Migration[8.0]
  def change
    create_table :likes do |t|
      t.string :identifier
      t.references :song, null: false, foreign_key: true

      t.timestamps

      t.index [:identifier, :song_id], unique: true
    end
  end
end
