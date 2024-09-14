class CreateTheses < ActiveRecord::Migration[6.1]
  def change
    create_table :theses do |t|
      t.references :magazine, foreign_key: true, null: false
      t.string :title, null: false
      t.integer :status, null: false, default: 0
      t.timestamps
    end
  end
end
