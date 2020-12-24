class AddLikeableCountToFavPlaces < ActiveRecord::Migration[6.0]
  def self.up
    add_column :fav_places, :likeable_count, :integer, null: false, default: 0
  end

  def self.down
    remove_column :fav_places, :likeable_count
  end
end
