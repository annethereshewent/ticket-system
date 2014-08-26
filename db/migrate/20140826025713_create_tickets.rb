class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :title
      t.string :application
      t.string :summary

      t.timestamps
    end
  end
end
