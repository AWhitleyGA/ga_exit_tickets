class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      t.integer :number, null: false
      t.string :name, null: false
      t.date :date, null: false
      t.time :start_time, null: false
      t.time :end_time, null: false
      t.decimal :avg_rating
      t.references :user, null: false
      t.references :program, null: false
      t.timestamps
    end
  end
end
