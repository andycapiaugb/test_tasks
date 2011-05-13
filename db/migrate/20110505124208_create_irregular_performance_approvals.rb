class CreateIrregularPerformanceApprovals < ActiveRecord::Migration
  def self.up
    create_table :irregular_performance_approvals do |t|
      t.references :taskrequests_step
      t.boolean :verdict
      t.text :motivation

      t.timestamps
    end
  end

  def self.down
    drop_table :irregular_performance_approvals
  end
end
