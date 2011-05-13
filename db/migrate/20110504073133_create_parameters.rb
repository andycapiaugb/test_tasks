class CreateParameters < ActiveRecord::Migration
  def self.up
    create_table :parameters do |t|
      t.references :step
      t.string :name
      t.string :value
      t.string :table
      t.string :field

      t.timestamps
    end
  end

  def self.down
    drop_table :parameters
  end
end
