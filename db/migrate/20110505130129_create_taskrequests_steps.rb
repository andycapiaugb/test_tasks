class CreateTaskrequestsSteps < ActiveRecord::Migration
  def self.up
    create_table :taskrequests_steps do |t|
      t.references :taskrequest
      t.references :step
      t.boolean :current
      t.integer :executer_id
      t.datetime :completed_at

      t.timestamps
    end
  end

  def self.down
    drop_table :taskrequests_steps
  end
end
