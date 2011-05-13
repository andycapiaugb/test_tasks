class CreateCollegeNotes < ActiveRecord::Migration
  def self.up
    create_table :college_notes do |t|
      t.integer :college_id
      t.text :note

      t.timestamps
    end
  end

  def self.down
    drop_table :college_notes
  end
end
