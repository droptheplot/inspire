class CreateRules < ActiveRecord::Migration[5.0]
  def change
    create_table :rules do |t|
      t.string :keyword, null: false
      t.references :tag, foreign_key: true

      t.timestamps
    end

    add_index :rules, :keyword, unique: true
  end
end
