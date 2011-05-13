class CreateTaskrequests < ActiveRecord::Migration
  def self.up
    create_table :taskrequests do |t|
      t.references :user
      t.references :task

      t.timestamps
    end
  end

  def self.down
    drop_table :taskrequests
  end
end
