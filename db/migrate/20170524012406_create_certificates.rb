class CreateCertificates < ActiveRecord::Migration[5.0]
  def change
    create_table :certificates do |t|
      t.string :title
      t.string :granted_by
      t.string :year
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
