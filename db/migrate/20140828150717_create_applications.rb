class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :name
      t.references :ticket, index: true

      t.timestamps
    end
  end
end
