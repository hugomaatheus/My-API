class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.text :abstract
      t.references :author

      t.timestamps
    end
  end
end
