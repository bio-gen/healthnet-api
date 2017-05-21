class CreateEducations < ActiveRecord::Migration[5.0]
  def change
    create_table :educations do |t|
      t.string :school
      t.string :degree
      t.string :field
      t.text :description
      t.string :start_year
      t.string :end_year
      t.boolean :current, default: :false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
