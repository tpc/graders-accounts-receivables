class CreateCourseworks < ActiveRecord::Migration
  def self.up
    create_table :courseworks do |t|
      t.string :title
      t.integer :course_id

      t.timestamps
    end
  end

  def self.down
    drop_table :courseworks
  end
end
