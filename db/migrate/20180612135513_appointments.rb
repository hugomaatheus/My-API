class Appointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.references :article
      t.references :author  

      t.timestamps
    end
  end
end
