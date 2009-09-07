class CreatePrerequisites < ActiveRecord::Migration
  def self.up
    create_table :prerequisites do |t|
      t.integer :subject_id
      t.integer :prereq_id

      t.timestamps
    end
  end

  def self.down
    drop_table :prerequisites
  end
end
