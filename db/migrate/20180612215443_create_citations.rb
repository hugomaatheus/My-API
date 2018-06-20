class CreateCitations < ActiveRecord::Migration[5.1]
  def change
    create_table :citations do |t|
      t.string :my_type
      t.references :author

      t.timestamps
    end
  end
end
