class CreateResearcherThesisRels < ActiveRecord::Migration[6.1]
  def change
    create_table :researcher_thesis_rels do |t|
      t.references :thesis, foreign_key: true, null: false
      t.references :researcher, foreign_key: true, null: false
      t.timestamps
    end
  end
end
