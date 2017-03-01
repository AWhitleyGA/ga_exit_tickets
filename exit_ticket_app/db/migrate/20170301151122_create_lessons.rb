class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      t.integer :number
      t.string :name
      t.date :date
      t.time :start_time
      t.time :end_time
      t.references :user
      t.timestamps
    end
  end
end
