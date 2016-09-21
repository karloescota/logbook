class CreateLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :logs do |t|
      t.references :user, index: true
      t.datetime :time_in
      t.datetime :time_out
      t.timestamps null: false
    end
  end
end
