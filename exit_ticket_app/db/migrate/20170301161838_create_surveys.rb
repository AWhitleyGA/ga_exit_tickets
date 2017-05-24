class CreateSurveys < ActiveRecord::Migration[5.0]
  def change
    create_table :surveys do |t|
      t.string :respondent_name
      t.integer :lo_rating, null: false
      t.integer :delivery_rating, null: false
      t.integer :comfort_rating, null: false
      t.string :positive_comment
      t.string :negative_comment
      t.string :general_comment
      t.boolean :attended_office_hours, null: false
      t.references :lesson, null: false
      t.timestamps
    end
  end
end
