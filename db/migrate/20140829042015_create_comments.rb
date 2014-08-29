class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user
      t.text :body
      t.references :ticket, index: true

      t.timestamps
    end
  end
end
