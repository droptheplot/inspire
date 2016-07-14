class CreatePublications < ActiveRecord::Migration[5.0]
  def change
    create_table :publications do |t|
      t.string :title
      t.text :content
      t.references :author, foreign_key: true
      t.text :description
      t.string :type

      t.timestamps
    end
  end
end
