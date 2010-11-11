class RemoveReceivedFromAndAddDispositionToListing < ActiveRecord::Migration
  def self.up
change_column :listings, :received, :string
rename_column :listings, :received, :disposition
  end

  def self.down
  end
end
