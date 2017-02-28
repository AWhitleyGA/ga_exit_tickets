class CreatePrograms < ActiveRecord::Migration[5.0]
  def change
    create_table :programs do |t|
      t.string :name
      t.string :location
      t.boolean :is_active?
      t.timestamps
    end
  end
end
