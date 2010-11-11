class CreateListings < ActiveRecord::Migration
  def self.up
    create_table :listings do |t|
      t.string :grader_id
      t.string :student_id
      t.boolean :received

      t.timestamps
    end
  end

  def self.down
    drop_table :listings
  end
end
