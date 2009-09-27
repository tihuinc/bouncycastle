class AddDescriptionToSubject < ActiveRecord::Migration
  def self.up
    add_column :subjects, :description, :text
  end

  def self.down
    remove_column :subjects, :description
  end
end
