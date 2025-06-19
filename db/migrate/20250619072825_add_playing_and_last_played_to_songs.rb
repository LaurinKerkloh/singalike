class AddPlayingAndLastPlayedToSongs < ActiveRecord::Migration[8.0]
  def change
    add_column :songs, :playing, :boolean, default: false, null: false
    add_column :songs, :last_played, :timestamp
  end
end
