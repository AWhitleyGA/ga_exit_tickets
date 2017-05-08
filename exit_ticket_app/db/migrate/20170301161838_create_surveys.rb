class CreateSurveys < ActiveRecord::Migration[5.0]
  def change
    create_table :surveys do |t|
      t.string :respondent_name
      t.integer :lo_rating
      t.integer :delivery_rating
      t.integer :comfort_rating
      t.string :positive_comment
      t.string :negative_comment
      t.string :general_comment
      t.boolean :attended_office_hours
      t.references :lesson
      t.timestamps
    end
  end
end
