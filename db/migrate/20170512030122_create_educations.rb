class CreateEducations < ActiveRecord::Migration[5.0]
  def change
    create_table :educations do |t|
      t.string :school
      t.string :degree
      t.string :field
      t.text :description
      t.string :from_year
      t.string :to_year
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
