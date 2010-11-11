class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.string :name
      t.string :DRS_ID
      t.string :FRSB_ID

      t.timestamps
    end
  end

  def self.down
    drop_table :students
  end
end
