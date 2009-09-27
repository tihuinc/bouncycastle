class AddDescriptionToResource < ActiveRecord::Migration
  def self.up
    add_column :resources, :description, :text
  end

  def self.down
    remove_column :resources, :description
  end
end
