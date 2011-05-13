class CreateIrregularPerformanceRequests < ActiveRecord::Migration
  def self.up
    create_table :irregular_performance_requests do |t|
      t.references :taskrequests_step
      t.string :event
      t.datetime :from
      t.datetime :to
      t.string :employee
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :irregular_performance_requests
  end
end
