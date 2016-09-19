class CreateLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :logs do |t|
      t.references :user, index: true
      t.time :in
      t.time :out
      t.date :date
      t.time :total_hours
      t.timestamps null: false
    end
  end
end
