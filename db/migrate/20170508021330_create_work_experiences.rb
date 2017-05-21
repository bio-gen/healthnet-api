class CreateWorkExperiences < ActiveRecord::Migration[5.0]
  def change
    create_table :work_experiences do |t|
      t.string :title
      t.string :company
      t.string :location
      t.string :start_year
      t.string :end_year
      t.boolean :current, defaukt: :false
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
