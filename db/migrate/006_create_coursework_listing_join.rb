class CreateCourseworkListingJoin < ActiveRecord::Migration
  def self.up
    create_table :courseworks_listings, :id => false do |t|
      t.integer :coursework_id
      t.integer :listing_id
    end
  end

  def self.down
    drop_table :courseworks_listings
  end
end
