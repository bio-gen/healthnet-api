class CreateWorkExperiences < ActiveRecord::Migration[5.0]
  def change
    create_table :work_experiences do |t|
      t.string :title
      t.string :company
      t.string :location
      t.date :start_date
      t.date :end_date
      t.boolean :current
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
