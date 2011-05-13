class CreateNewEmployeeRequests < ActiveRecord::Migration
  def self.up
    create_table :new_employee_requests do |t|
      t.references :taskrequests_step
      t.string :osn
      t.text :motivation

      t.timestamps
    end
  end

  def self.down
    drop_table :new_employee_requests
  end
end
