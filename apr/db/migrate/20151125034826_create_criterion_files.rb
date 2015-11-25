class CreateCriterionFiles < ActiveRecord::Migration
  def change
    create_table :criterion_files do |t|
      t.references :criterion_detail, index: true, foreign_key: true
      t.string :name
      t.string :attachment

      t.timestamps null: false
    end
  end
end
