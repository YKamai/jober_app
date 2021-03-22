class CreateJobs < ActiveRecord::Migration[6.0]
  def self.up
    create_table :jobs do |table|
      table.integer :priority, default: 0, null: false
      table.integer :attempts, default: 0, null: false
      table.text :handler,                 null: false
      table.text :last_error
      table.datetime :run_at
      table.datetime :locked_at
      table.datetime :failed_at
      table.string :locked_by
      table.string :queue
      table.timestamps null: true
    end

    add_index :jobs, %i[priority run_at], name: 'jobs_priority'
  end

  def self.down
    drop_table :jobs
  end
end
