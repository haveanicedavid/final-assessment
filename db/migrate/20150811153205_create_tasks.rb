class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :notes
      t.integer :status, :default => 0
      t.datetime :due_date
      t.datetime :start_date

      t.timestamps null: false
    end
  end
end
