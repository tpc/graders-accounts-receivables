class CreateGraders < ActiveRecord::Migration
  def self.up
    create_table :graders do |t|
      t.string :name
      t.string :pri_phone
      t.string :p_ph_type
      t.string :sec_phone
      t.string :s_ph_type
      t.string :email_address

      t.timestamps
    end
  end

  def self.down
    drop_table :graders
  end
end
