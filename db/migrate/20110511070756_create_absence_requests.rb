class CreateAbsenceRequests < ActiveRecord::Migration
  def self.up
    create_table :absence_requests do |t|
      t.references :taskrequests_step
      t.string :absence_type
      t.date :from
      t.date :to

      t.timestamps
    end
  end

  def self.down
    drop_table :absence_requests
  end
end
