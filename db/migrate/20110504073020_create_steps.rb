class CreateSteps < ActiveRecord::Migration
  def self.up
    create_table :steps do |t|
      t.references :task
      t.string :label
      t.string :name
      t.integer :executer_id
      t.boolean :self
      t.boolean :superior
      t.boolean :synchronous

      t.timestamps
    end
  end

  def self.down
    drop_table :steps
  end
end
